import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/router_helper.dart';
import '../../../../core/router/routes.dart';
import '../../logic/home_cubit.dart';
import 'select_destination_map_screen.dart';
import 'select_destination_widget.dart';

class TextFormFieldForSelectDestinationWidget extends StatelessWidget {
  const TextFormFieldForSelectDestinationWidget(
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
  Widget build(BuildContext context) {
    return TextFormField(
      controller: destinationController,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: "To",
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        fillColor: AppColors.primaryLightColor,
        filled: true,
        prefixIcon: Icon(
          Icons.search_rounded,
          size: 20,
          color: Theme.of(context).iconTheme.color,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
      ),
      readOnly: true,
      onTap: () {
        navigateTo(
            context,Routes.selectDestinationPage,
            extra: {
          'cubit': cubit,
          'address': address,
          'destinationController': destinationController,
          'categoryName': categoryName,
        });
        // showModalBottomSheet(
        //   shape: RoundedRectangleBorder(
        //     side: const BorderSide(),
        //     borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(27.r),
        //       topLeft: Radius.circular(27.r),
        //     ),
        //   ),
        //   constraints: BoxConstraints(maxHeight: 690.h, minHeight: 500.w),
        //   useSafeArea: true,
        //   isScrollControlled: true,
        //   context: context,
        //   builder: (context) {
        //     return
        //       BlocProvider.value(
        //       value: cubit,
        //       child: SelectDestinationWidget(
        //         changeMapTap: () async {
        //           LatLng? selectedLocation = await Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => BlocProvider.value(
        //                 value: cubit,
        //                 child: SelectDestinationMapScreen(
        //                   homeCubit: cubit,
        //                   categoryName: categoryName,
        //                 ),
        //               ),
        //             ),
        //           );
        //           if (selectedLocation != null) {
        //             cubit
        //                 .getDestinationAddress(
        //               lat: selectedLocation.latitude,
        //               lng: selectedLocation.longitude,
        //             )
        //                 .then((_) {
        //               destinationController.text = cubit
        //                   .destinationAddress; // Update the address in the field
        //             });
        //           }
        //         },
        //         controller: destinationController,
        //         address: cubit.address,
        //       ),
        //     );
        //   },
        // );
      },
    );
  }
}
