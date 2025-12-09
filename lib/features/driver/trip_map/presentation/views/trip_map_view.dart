import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/driver/new_rides/data/repo/new_ride_repo.dart';
import 'package:shakshak/features/rides/data/models/ride.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../../user_home/presentation/widgets/my_map_widget.dart';
import '../../../new_rides/data/models/ride_model.dart';
import '../../../new_rides/presentation/view_model/ride_cubit.dart';
import '../../../new_rides/presentation/view_model/ride_state.dart';
import '../../../new_rides/presentation/widgets/driver_map.dart';
import '../widgets/trip_map_details_item.dart';

class TripMapView extends StatelessWidget {
   TripMapView({super.key,required this.ride});
  final Ride ride;
  final Completer<GoogleMapController> mapCompleter = Completer<GoogleMapController>();
  GoogleMapController? mapController;
  Future<void> onMapCreated(GoogleMapController controller) async {
    mapCompleter.complete(controller);
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RideCubit(sl<NewRideRepo>()),
      child: BlocConsumer<RideCubit, RideState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return BaseLayoutView(
            horizontalPadding: 0,
            title: S.of(context).tripMap,
            body: Stack(
              alignment: Alignment.center,
              children: [
                DriverMapWidget(
                  onCameraIdle: (){},
                  onCameraMove: (
                      CameraPosition position
                      ){},
                  onCameraMoveStarted: (){},
                  onMapCreated: onMapCreated,
                  cubit: context.read<RideCubit>(),
                  // testMode: true,
                  start: LatLng(
                    double.parse(ride.sourceLat!),
                    double.parse(ride.sourceLong!),
                  ),
                  end: LatLng(
                    double.parse(ride.destinationLat!),
                    double.parse(ride.destinationLong!),
                  ),
                  cars: [
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: TripMapDetailsItem(ride: ride),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
