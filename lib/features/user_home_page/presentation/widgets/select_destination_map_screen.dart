import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_states.dart';
import 'marker_of_user_on_map_widget.dart';
import 'my_map_widget.dart';

class SelectDestinationMapScreen extends StatefulWidget {
  final HomeCubit homeCubit;
  final String categoryName;

  SelectDestinationMapScreen(
      {required this.homeCubit, required this.categoryName});

  @override
  _SelectDestinationMapScreenState createState() =>
      _SelectDestinationMapScreenState();
}

class _SelectDestinationMapScreenState
    extends State<SelectDestinationMapScreen> {
  GoogleMapController? mapController;

  LatLng? selectedDestination;

  void onCameraIdle() {
    widget.homeCubit.openTripContainer();
    if (selectedDestination != null) {
      // widget.homeCubit.getDestinationAddress(
      //   lat: selectedDestination!.latitude,
      //   lng: selectedDestination!.longitude,
      // );
      widget.homeCubit.setDestination(LatLng(
        selectedDestination!.latitude,
        selectedDestination!.longitude,
      ));
    }
  }

  void onCameraMove(CameraPosition position) {
    selectedDestination = position.target;
  }

  void onCameraMoveStarted() {
    widget.homeCubit.changeBuscandoFlagForDestination(false);
    widget.homeCubit.closeTripContainer().then((value) {});
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // Check if the Completer is already completed
    if (!widget.homeCubit.mapController.isCompleted) {
      widget.homeCubit.mapController.complete(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Select Destination"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (selectedDestination != null) {
                // Return the selected LatLng to the previous screen
                Navigator.pop(context, selectedDestination);
              }
            },
          )
        ],
      ),
      body: Stack(
        children: [
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Stack(
                children: [
                  UserMapWidget(
                    cars :[],
                    cubit: widget.homeCubit,
                    // Use the HomeCubit to get the initial mapLocation
                    // When the map is created
                    onMapCreated: onMapCreated,
                    // Called when camera movement starts
                    onCameraMoveStarted: onCameraMoveStarted,

                    // Called when the camera moves (e.g., user drags the map)
                    onCameraMove: onCameraMove,

                    // Called when the camera stops moving
                    onCameraIdle: onCameraIdle,
                  ),
                  // Center(
                  //   child: MarkerOfUserOnMapWidget(
                  //     buscando: widget.homeCubit.destinationBuscando,
                  //     header: widget.homeCubit.destinationAddress,
                  //     markerHeight: 150.0,
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
