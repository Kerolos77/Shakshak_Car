import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shakshak/core/utils/converts.dart';

import '../../../../../core/constants/key_const.dart';
import '../../../data/models/place_model.dart';
import '../../../data/repo/user_home_repo.dart';
import 'user_home_states.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit(this.userHomeRepo) : super(InitialUserHomeState());
  final UserHomeRepo userHomeRepo;

  static UserHomeCubit get(context) => BlocProvider.of(context);

  Future<void> getCaptions() async {
    emit(UserHomeCaptionLoading());
    final result = await userHomeRepo.getCaptions();
    result.fold(
      (error) {
        debugPrint("error while get captions data ${error.message}");
        return emit(UserHomeCaptionFailure(errorMessage: error.message));
      },
      (success) {
        return emit(UserHomeCaptionSuccess(userHomeCaptionModel: success));
      },
    );
  }

  Future<void> getServices() async {
    emit(ServicesLoading());
    final result = await userHomeRepo.getServices();
    result.fold(
      (error) {
        debugPrint("error while get services data ${error.message}");
        return emit(ServicesFailure(errorMessage: error.message));
      },
      (success) {
        return emit(ServicesSuccess(servicesModel: success));
      },
    );
  }

  LatLng mapLocation = const LatLng(0, 0);

  Completer<GoogleMapController> mapController = Completer();
  Location location = Location();
  bool buscando = false;
  var zoomLevel = 17.0;
  var mapBearing = 0.0;
  PlacePrediction? sourcePlace;
  PlacePrediction? destinationPlace;

  TextEditingController? sourceController = TextEditingController();
  TextEditingController? destinationController = TextEditingController();

  bool isSourceSelected = false;

  List<PlacePrediction> placePredictions = [];

  void changeLocation(
    LatLng lat,
  ) {
    this.mapLocation = lat;
  }

  void changeBuscandoFlag(bool flag) {
    buscando = flag;
    emit(ChangeBuscandoFlagUserHomeState());
  }

  void getMyLocation() {
    location.getLocation().then((value) {
      selectPlace(lat: value.latitude!, lng: value.longitude!, isSource: true);
      changeLocation(
        LatLng(value.latitude!, value.longitude!),
      );
      animateCamera();
    });
  }

  Future<void> animateCamera() async {
    final GoogleMapController controller = await this.mapController.future;
    CameraPosition cameraPosition;
    cameraPosition = CameraPosition(
      target: mapLocation,
      zoom: zoomLevel,
      bearing: mapBearing,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<PlacePrediction?> getAddress(double lat, double lng) async {
    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=${KeyConst.mapKey}&language=ar",
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["status"] == "OK" && data["results"].isNotEmpty) {
          final result = data["results"][0];

          return PlacePrediction(
            description: result["formatted_address"],
            placeId: result["place_id"] ?? "",
            mainText: result["address_components"][0]["long_name"] ?? "",
            secondaryText: result["formatted_address"],
            types: (result["types"] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList(),
            terms: null,
            placeName:
                result["formatted_address"].split(RegExp(r"[،,]")).first.trim(),
            lat: lat,
            lng: lng,
          );
        }
      }
      return null;
    } catch (e) {
      print("Error in getAddress: $e");
      return null;
    }
  }

  Future<void> getPlacesSuggestions(String input) async {
    if (input.isEmpty) {
      placePredictions = [];
      emit(SuggestionsLoadedState(placePredictions));
      return;
    }
    final languageCode = Converts().detectLanguageCodeByUnicode(input);
    print("detected language code: $languageCode");
    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/place/autocomplete/json"
      "?input=$input"
      "&key=${KeyConst.mapKey}"
      "&components=country:eg"
      "&language=$languageCode",
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["status"] == "OK") {
          final predictions = data["predictions"] as List;
          placePredictions = predictions
              .map((p) => PlacePrediction.fromAutocomplete(p))
              .toList();

          emit(SuggestionsLoadedState(placePredictions));
        } else {
          placePredictions = [];
          emit(SuggestionsLoadedState(placePredictions));
          print("Places API error: ${data["status"]}");
        }
      } else {
        throw Exception("Failed request: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      placePredictions = [];
      emit(SuggestionsLoadedState(placePredictions));
    }
  }

  Future<PlacePrediction?> getPlaceDetails(String placeId) async {
    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/place/details/json"
      "?place_id=$placeId"
      "&key=${KeyConst.mapKey}"
      "&language=ar",
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["status"] == "OK") {
          final details = data["result"];

          return PlacePrediction(
            description: details["formatted_address"] ?? "",
            placeId: details["place_id"],
            mainText: details["name"] ?? "",
            secondaryText: details["vicinity"] ?? "",
            lat: details["geometry"]["location"]["lat"],
            lng: details["geometry"]["location"]["lng"],
            types: (details["types"] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList(),
          );
        }
      }
    } catch (e) {
      print("Error fetching place details: $e");
    }
    return null;
  }

  Future<void> selectPlace({
    String? placeId,
    double? lat,
    double? lng,
    required bool isSource, // true = source, false = destination
  }) async {
    print(
        "selectPlace called with placeId: $placeId, lat: $lat, lng: $lng, isSource: $isSource");
    try {
      PlacePrediction? place;

      if (placeId != null) {
        // الحالة الأولى: جاي من الـ autocomplete
        final details = await getPlaceDetails(
            placeId); // دي بترجع JSON من Google Places Details
        place = details;
      } else if (lat != null && lng != null) {
        // الحالة الثانية: جاي من الماب
        final addressData = await getAddress(lat, lng); // Reverse Geocoding API
        place = addressData;
      }

      if (place != null) {
        if (isSource) {
          sourcePlace = place;
          sourceController!.text = place.placeName ?? place.description ?? "";
        } else {
          destinationPlace = place;
          destinationController!.text =
              place.placeName ?? place.description ?? "";
        }
        emit(PlaceSelectedState(sourcePlace, destinationPlace));
      }
    } catch (e) {
      print("Error selecting place: $e");
      emit(UserHomeErrorState("Failed to select place"));
    }
  }
}
