import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/user_home/data/models/services_model.dart';
import 'package:shakshak/features/user_home/presentation/view_models/user_home_cubit.dart';
import 'package:shakshak/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'vehicle_item_widget.dart';

class SelectVehicleSection extends StatefulWidget {
  const SelectVehicleSection({super.key});

  @override
  State<SelectVehicleSection> createState() => _SelectVehicleSectionState();
}

class _SelectVehicleSectionState extends State<SelectVehicleSection> {
  @override
  void initState() {
    super.initState();
    context.read<UserHomeCubit>().getServices();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).selectVehicle,
            style: Styles.textStyle16SemiBold(context)),
        12.ph,
        BlocBuilder<UserHomeCubit, UserHomeState>(
          buildWhen: (previous, current) =>
              current is ServicesLoading ||
              current is ServicesSuccess ||
              current is ServicesFailure,
          builder: (context, state) {
            if (state is ServicesSuccess) {
              return SizedBox(
                height: 140.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => VehicleItemWidget(
                          service: state.servicesModel.data![index],
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                    separatorBuilder: (context, index) => 12.pw,
                    itemCount: state.servicesModel.data!.length),
              );
            } else if (state is ServicesLoading) {
              return Row(
                children: List.generate(3, (index) {
                  return Row(
                    children: [
                      Skeletonizer(
                        child: VehicleItemWidget(
                          service: ServiceData(
                              image: '',
                              id: 0,
                              name: 'test',
                              offerRate: 'aaaaaaaaaaa',
                              serviceType: 'aaaaaaaaaaaa'),
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      ),
                      if (index != 2) 12.pw,
                    ],
                  );
                }),
              );
            } else if (state is ServicesFailure) {
              return Center(
                child: SizedBox(
                  height: 50.h,
                  child: Text(
                    state.errorMessage,
                    style: Styles.textStyle16(context),
                  ),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
