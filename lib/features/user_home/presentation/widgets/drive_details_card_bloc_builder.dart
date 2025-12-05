import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_loading.dart';
import 'package:shakshak/features/rides/presentation/view_models/rides_cubit.dart';

import '../../../../core/router/routes.dart';
import '../widgets/drive_details_card.dart';

class DriveDetailsCardBlocBuilder extends StatefulWidget {
  const DriveDetailsCardBlocBuilder({
    super.key,
  });

  @override
  State<DriveDetailsCardBlocBuilder> createState() =>
      _DriveDetailsCardBlocBuilderState();
}

class _DriveDetailsCardBlocBuilderState
    extends State<DriveDetailsCardBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<RidesCubit>().getRides(inCity: 1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RidesCubit, RidesState>(
      builder: (context, state) {
        if (state is RidesSuccess) {
          if (state.ridesModel.data!.started!.isNotEmpty) {
            return Column(
              children: [
                DriveDetailsCard(
                  onTap: () {
                    navigateTo(context, Routes.driveDetailsView);
                  },
                  ride: state.ridesModel.data!.started![0],
                ),
                12.ph,
              ],
            );
          }
        }
        if (state is RidesLoading) {
          return CustomLoading();
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
