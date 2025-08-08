import 'dart:async';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../data/models/calc_price_time_distance_request_body.dart';
import '../data/models/calc_price_time_distance_response.dart';
import '../data/models/cancel_ride_request_body.dart';
import '../data/models/request_ride_request_body.dart';
import '../data/models/ride_request_response_body.dart';
import '../data/models/trip_type_model.dart';
import '../data/repository/user_home_repository.dart';
import 'home_states.dart';


class HomeCubit extends Cubit<HomeState> {
  // UserHomeRepository userHomeRepository;

  HomeCubit(
      // this.userHomeRepository
      ) : super(InitialHomeState()) {}

  static HomeCubit get(context) => BlocProvider.of(context);

  calcPriceAndTimeDistance(
      {required CalcPriceTimeDistanceRequestBody
          calcPriceTimeDistanceRequestBody})
  {
    emit(CalcPriceAndTimeDistanceLoadingState());
    emit(CalcPriceAndTimeDistanceSuccessState());
    // userHomeRepository
    //     .calcPriceAndTimeDistance(
    //         calcPriceTimeDistanceRequestBody: calcPriceTimeDistanceRequestBody)
    //     .then((value) {
    //   value.whenOrNull(success: (data) {
    //     emit(
    //       CalcPriceAndTimeDistanceSuccessState(
    //         calcPriceTimeDistanceResponse:
    //             CalcPriceTimeDistanceResponse.fromJson(data),
    //       ),
    //     );
    //   }, failure: (error) {
    //     emit(CalcPriceAndTimeDistanceErrorState(
    //         error: NetworkExceptions.getErrorMessage(error)));
    //   });
    // });
  }

  requestRide({required RequestRideRequestBody requestRideRequestBody})
  {
    emit(RideRequestLoadingState());
    emit(RideRequestSuccessState(

    ));
    // userHomeRepository
    //     .requestRide(requestRideRequestBody: requestRideRequestBody)
    //     .then((value) {
    //   value.whenOrNull(success: (data) {
    //     emit(
    //       RideRequestSuccessState(
    //         rideRequestResponseBody: RideRequestResponseBody.fromJson(data),
    //       ),
    //     );
    //   }, failure: (error) {
    //     emit(RideRequestErrorState(
    //         error: NetworkExceptions.getErrorMessage(error)));
    //   });
    // });
  }

  cancelRideRequestByPassenger(
      {required CancelRideRequestBody cancelRideRequestBody})
  {
    emit(CancelRideRequestPassengerLoadingState());
    emit(CancelRideRequestPassengerSuccessState());
    // userHomeRepository
    //     .cancelRideRequestByPassenger(
    //         cancelRideRequestBody: cancelRideRequestBody)
    //     .then((value) {
    //   value.whenOrNull(success: (data) {
    //     emit(
    //       CancelRideRequestPassengerSuccessState(
    //         cancelRideResponseBody: CancelRideResponseBody.fromJson(data),
    //       ),
    //     );
    //   }, failure: (error) {
    //     emit(CancelRideRequestPassengerErrorState(
    //         error: NetworkExceptions.getErrorMessage(error)));
    //   });
    // });
  }

  // getCategoryOfVehicle() async {
  //   emit(GetCategoryOfVehicleLoading());
  //   final result = await userHomeRepository.getCategoryOfVehicle();
  //   result.whenOrNull(success: (success) {
  //     tripTypeList = success.data!.body!;
  //     emit(GetCategoryOfVehicleSuccess(categoryOfVehicleResponse: success));
  //   }, failure: (failure) {
  //     emit(GetCategoryOfVehicleFailure(
  //         message: NetworkExceptions.getErrorMessage(failure)));
  //   });
  // }

  List<TripTypeModel> tripTypeList = [
    TripTypeModel(type: "Car", image: "assets/images/car1.png", info: "Car"),
    TripTypeModel(
        type: "comfort", image: "assets/images/car1.png", info: "comfort"),
    TripTypeModel(type: "Bike", image: "assets/images/bike.png", info: "Bike"),
    TripTypeModel(type: "VIP", image: "assets/images/car1.png", info: "VIP"),
    TripTypeModel(type: "Van", image: "assets/images/car1.png", info: "Van"),
  ];
  String selectedCategoryName = ""; // To hold the selected trip type name

  LatLng mapLocation = const LatLng(0, 0);

  bool locationButtonFlag = false;

  Completer<GoogleMapController> mapController = Completer();
  Location location = Location();
  bool buscando = false;
  var zoomLevel = 17.0;
  var mapBearing = 0.0;

  GeoCode geoCode = GeoCode();

  String address = 'No Address Found';

  String destinationAddress = 'No Address Found';
  bool destinationBuscando = false;
  LatLng destinationLocation = const LatLng(0, 0);

  void setDestination(LatLng latLng) {
    destinationLocation = latLng;
    getDestinationAddress(lat: latLng.latitude, lng: latLng.longitude);
  }

  int streetNumber = 0;

  void changeLocation(
    LatLng lat,
  ) {
    this.mapLocation = lat;
  }

  void changeLocationButtonFlag(bool flag) {
    locationButtonFlag = flag;
  }

  void changeBuscandoFlag(bool flag) {
    buscando = flag;
    emit(ChangeBuscandoFlagHomeState());
  }

  void changeBuscandoFlagForDestination(bool flag) {
    destinationBuscando = flag;
    emit(ChangeBuscandoFlagHomeState());
  }

  void openTripContainer() {
    emit(OpenTripContainerHomeState());
  }

  Future<void> closeTripContainer() async {
    emit(CloseTripContainerHomeState());
  }

  void getMyLocation({
    required GoogleMapController mapController,
    required LatLng targetLocation,
    required Offset markerOffset,
    required Size screenSize,
}) {
    location.getLocation().then((value) {
      print("targetlocationonmapfff: ${value.latitude}, ${value.longitude}");
      print('get location');
      changeLocation(
        LatLng(value.latitude!, value.longitude!),
      );
     moveCameraToCustomScreenOffset(
        mapController:mapController,
        markerOffset:markerOffset,

        screenSize:screenSize ,
        targetLocation:LatLng(value.latitude!, value.longitude!),
      );
      // animateCamera();

    });
  }

  void getMyLocationUpDate(context) {
    location.onLocationChanged.listen((LocationData currentLocation) {
      emit(GetMyLocationHomeState());
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
  Future<void> moveCameraToCustomScreenOffset({
    required GoogleMapController mapController,
    required LatLng targetLocation,
    required Offset markerOffset,
    required Size screenSize,
  }) async {
    try {
      print("targetlocationonmap: ${targetLocation.latitude}, ${targetLocation.longitude}");
      final targetScreenCoord = await mapController.getScreenCoordinate(targetLocation);
      final dx = (markerOffset.dx - screenSize.width ).toInt();
      final dy = (markerOffset.dy - screenSize.height ).toInt();
      final adjustedScreenCoord = ScreenCoordinate(
        x: targetScreenCoord.x - dx,
        y: targetScreenCoord.y - dy,
      );
      final adjustedLatLng = await mapController.getLatLng(adjustedScreenCoord);
      await mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: adjustedLatLng,
          zoom: zoomLevel,
        ),
      ));
    } catch (e) {
      print("Error moving camera with zoom sensitivity: $e");
    }
  }
  Future<LatLng?> getMarkerLatLngFromScreenOffset({
    required GoogleMapController mapController,
    required Offset markerOffset,
  }) async {
    try {
      final latLng = await mapController.getLatLng(ScreenCoordinate(
        x: markerOffset.dx.toInt(),
        y: markerOffset.dy.toInt(),
      ));
      return latLng;
    } catch (e) {
      print("Error getting LatLng from screen offset: $e");
      return null;
    }
  }



  getAddress({
    required double lat,
    required double lng,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    geoCode.reverseGeocoding(latitude: lat, longitude: lng).then((value) {
      address = value.streetAddress.toString();
      buscando = true;
      emit(SuccessGetAddressHomeState());
    }).then((value) {
      destinationAddress != 'No Address Found'
          ? getDestinationAddress(
              lat: destinationLocation.latitude,
              lng: destinationLocation.longitude)
          : null;
    });
  }

  getDestinationAddress({
    required double lat,
    required double lng,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    geoCode.reverseGeocoding(latitude: lat, longitude: lng).then((value) {
      destinationAddress = value.streetAddress.toString();
      destinationBuscando = true;
      emit(SuccessGetDestinationAddressHomeState());
    }).then((value) {
      calcPriceAndTimeDistance(
        calcPriceTimeDistanceRequestBody: CalcPriceTimeDistanceRequestBody(
          category: "vip",
          droppOffLat: destinationLocation.latitude.toString(),
          droppOffLon: destinationLocation.longitude.toString(),
          pickUpLat: mapLocation.latitude.toString(),
          pickUpLon: mapLocation.longitude.toString(),
        ),
      );
    });
  }
}
