import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../view_models/user_home_cubit/user_home_cubit.dart';
import '../view_models/user_home_cubit/user_home_states.dart';
import 'my_map_widget.dart';

class SelectDestinationMapScreen extends StatefulWidget {
  final UserHomeCubit homeCubit;

  SelectDestinationMapScreen({
    required this.homeCubit,
  });

  @override
  _SelectDestinationMapScreenState createState() =>
      _SelectDestinationMapScreenState();
}

class _SelectDestinationMapScreenState
    extends State<SelectDestinationMapScreen> {
  GoogleMapController? mapController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? selectedDestination;

  void onCameraIdle() {
    // if (selectedDestination != null) {
    //   widget.homeCubit.getAddress(
    //     lat: selectedDestination!.latitude,
    //     lng: selectedDestination!.longitude,
    //   );
    //   // widget.homeCubit.getAddress(
    //   //   lat :selectedDestination!.latitude,
    //   //  lng:  selectedDestination!.longitude,
    //   // );
    // }
  }

  void onCameraMove(CameraPosition position) {
    // selectedDestination = position.target;
    // print("onCameraMove: $selectedDestination");
  }

  void onCameraMoveStarted() {
    // widget.homeCubit.changeBuscandoFlag(false);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        child: Icon(FontAwesomeIcons.check),
      ),
      body: Stack(
        children: [
          BlocConsumer<UserHomeCubit, UserHomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Stack(
                children: [
                  UserMapWidget(
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
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
