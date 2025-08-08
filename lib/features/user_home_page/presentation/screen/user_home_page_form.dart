import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../base_layout/presentation/widgets/custom_drawer.dart';
import '../../data/models/driver_offer.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_states.dart';
import '../widgets/custom_drawer_button.dart';
import '../widgets/drawer_button.dart';
import '../widgets/driver_offer_list.dart';
import '../widgets/marker_of_user_on_map_widget.dart';
import '../widgets/my_current_location_widget.dart';
import '../widgets/my_map_widget.dart';
import '../widgets/trip_info_column_widget.dart';

class UserHomePageForm extends StatefulWidget {
  const UserHomePageForm({super.key});

  @override
  State<UserHomePageForm> createState() => _UserHomePageFormState();
}

class _UserHomePageFormState extends State<UserHomePageForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _bottomSheetController;

  final TextEditingController locationController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController offerController = TextEditingController();

  GoogleMapController? mapController; // ✅ Null safe
  bool locationButtonFlag = false;
  int currentOfferIndex = 0;
  LatLng testMarkerLocation = LatLng(24.7136, 46.6753); // Riyadh coordinates
  Size size = Size.zero;

  /// ثابت يحدد ارتفاع الماركر من منتصف الشاشة
  double markerOffset = 100.h;
  // final double markerHeight = 80.h;

  List<DriverOffer> driverOffers = [];
  GlobalKey Key = GlobalKey();
  late HomeCubit cubit;
  Size markerSize = Size(0, 0);
  @override
  void dispose() {
    super.dispose();
  }

  Future<Size> getMarkerSize(GlobalKey key) async {
    final completer = Completer<Size>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
      final size = renderBox.size;
      completer.complete(size);
    });
    return completer.future;
  }


  Future<void> onCameraIdle() async {
    locationButtonFlag = false;

    if (mapController == null) {
      return;
    }

    markerSize = await getMarkerSize(Key);
    final size =MediaQuery.of(context).size;

    final Offset screenPointMarker = Offset(
      size.width ,
        size.height -(size.height -(markerSize.height*2+markerOffset*2))
    );

    final newLatLong= await cubit.getMarkerLatLngFromScreenOffset(
        mapController:mapController!,
        markerOffset: screenPointMarker,);

    cubit.mapLocation = newLatLong!;
    cubit.openTripContainer();

    cubit.getAddress(
      lat: newLatLong.latitude,
      lng: newLatLong.longitude,
    );
    print("📍 الموقع الجديد للكاميرا: ${newLatLong.latitude}, ${newLatLong.longitude}");
    testMarkerLocation= newLatLong;
  }


  void onCameraMoveStarted() {
    cubit.changeBuscandoFlag(false);
    if (!locationButtonFlag) {
      cubit.closeTripContainer();
    }
  }

  void onCameraMove(CameraPosition position) {
    // cubit.zoomLevel = position.zoom;
    cubit.mapBearing = position.bearing;
    cubit.mapLocation = position.target;
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    cubit.mapController.complete(controller);
    mapController = controller;
  }

  void showDriverOfferDialog() {
    if (currentOfferIndex < driverOffers.length) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            title: Text("Driver Offer ${currentOfferIndex + 1}"),
            content: DriverOfferList(
              offers: [driverOffers[currentOfferIndex]],
              onAcceptOffer: (offer) {
                setState(() {
                  driverOffers.remove(offer);
                });
                Navigator.of(context).pop();
                showNextOffer();
              },
              onRefuseOffer: (offer) {
                setState(() {
                  driverOffers.remove(offer);
                });
                Navigator.of(context).pop();
                showNextOffer();
              },
            ),
          );
        },
      );
    }
  }

  void showNextOffer() {
    currentOfferIndex++;
    if (currentOfferIndex < driverOffers.length) {
      showDriverOfferDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    // markerOffset = size.height/75*100; // Adjusted for marker height
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        cubit = HomeCubit.get(context);

        if (state is OpenTripContainerHomeState) {
          if (_bottomSheetController == null) {
            _bottomSheetController = _scaffoldKey.currentState?.showBottomSheet(
              enableDrag: false,
              backgroundColor: Colors.transparent,
              elevation: 6,
                  (context) => WillPopScope(
                onWillPop: () async => false,
                child: TripInfoColumnWidget(
                  destinationController: destinationController,
                  cubit: cubit,
                  tripTypeList: cubit.tripTypeList,
                  offerController: offerController,
                  onLocationTap: () async {
                    markerSize = await getMarkerSize(Key);
                    final size =MediaQuery.of(context).size;

                    final Offset screenPointMarker = Offset(
                        size.width ,
                        size.height -(size.height -(markerSize.height*2+markerOffset*2))
                    );
                    cubit.getMyLocation(
                        mapController: mapController!,
                        markerOffset:screenPointMarker,
                        screenSize:size ,
                        targetLocation: LatLng(cubit.mapLocation.latitude, cubit.mapLocation.longitude),);
                    cubit.getAddress(
                      lat: cubit.mapLocation.latitude,
                      lng: cubit.mapLocation.longitude,
                    );


                    locationButtonFlag = true;

                    // cubit.moveCameraToCustomScreenOffset(
                    //   mapController: mapController!,
                    //   markerOffset:screenPointMarker,
                    //
                    //   screenSize:size ,
                    //   targetLocation: LatLng(30.1425061, 31.3221873),
                    // );

                  },
                ),
              ),
            );

            _bottomSheetController!.closed.then((_) {
              _bottomSheetController = null;
            });
          }
        }

        if (state is CloseTripContainerHomeState) {
          _bottomSheetController?.close();
          _bottomSheetController = null;
        }

        if (state is RideRequestSuccessState) {
          setState(() {
            driverOffers = [
              DriverOffer(driverName: "Driver A", price: 20),
              DriverOffer(driverName: "Driver B", price: 18),
              DriverOffer(driverName: "Driver C", price: 15),
            ];
            currentOfferIndex = 0;
          });
          showDriverOfferDialog();
        }
      },
      builder: (context, state) {
        cubit = HomeCubit.get(context);
        return Scaffold(
          key: _scaffoldKey,
          extendBodyBehindAppBar: true,
          drawer: const CustomDrawer(),
          body: SafeArea(
            child: Stack(
              children: [
                // Map & marker

                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    UserMapWidget(
                      onCameraIdle: onCameraIdle,
                      onCameraMove: onCameraMove,
                      onCameraMoveStarted: onCameraMoveStarted,
                      onMapCreated: onMapCreated,
                      cubit: cubit,
                      cars: [
                        // testMarkerLocation!
                      ],
                    ),

                    Positioned(
                      // top: -markerOffset,
                      top: markerOffset,
                      child: MarkerOfUserOnMapWidget(
                        buscando: cubit.buscando,
                        header: cubit.address,
                        // markerHeight: markerHeight,
                        Key: Key,
                      ),
                    ),

                  ],
                ),
                // Drawer button
                Align(
                  alignment: Alignment.topLeft,
                  child: MyDrawerButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

