import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../logic/home_cubit.dart';
import '../widgets/select_destination_map_screen.dart';
import '../widgets/select_destination_widget.dart';

class SelectDestinationPage extends StatefulWidget {
  const SelectDestinationPage(
      {super.key,
      required this.cubit,
      required this.address,
      required this.destinationController,
      required this.categoryName});

  final HomeCubit cubit;
  // final Function()? onTap;
  final String address;

  final String categoryName;
  final TextEditingController destinationController;

  @override
  State<SelectDestinationPage> createState() => _SelectDestinationPageState();
}

class _SelectDestinationPageState extends State<SelectDestinationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: SelectDestinationWidget(
        changeMapTap: () async {
          LatLng? selectedLocation = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: widget.cubit,
                child: SelectDestinationMapScreen(
                  homeCubit: widget.cubit,
                  categoryName: widget.categoryName,
                ),
              ),
            ),
          );
          if (selectedLocation != null) {
            widget.cubit
                .getDestinationAddress(
              lat: selectedLocation.latitude,
              lng: selectedLocation.longitude,
            )
                .then((_) {
              widget.destinationController.text = widget
                  .cubit.destinationAddress; // Update the address in the field
            });
          }
        },
        controller: widget.destinationController,
        address: widget.cubit.address,
      ),
    );
  }
}
