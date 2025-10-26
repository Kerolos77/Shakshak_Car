import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import '../../../../features/user_home/presentation/view_models/user_home_cubit/user_home_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/app_colors.dart';
import '../../../router/router_helper.dart';
import '../../../router/routes.dart';
import '../custom_text_field.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    UserHomeCubit cubit = UserHomeCubit.get(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 24.r,
              width: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            SizedBox(height: 50.h, child: const VerticalDivider()),
            Container(
              height: 24.r,
              width: 24.r,
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Icon(Icons.place, color: Colors.white, size: 16.r),
            ),
          ],
        ),
        12.pw,
        Expanded(
          child: Column(
            children: [
              CustomTextField(
                hint: S.of(context).pickupLocation,
                controller: cubit.sourceController,
                isReadOnly: true,
                borderColor: cubit.isSourceSelected
                    ? AppColors.greenColor
                    : AppColors.secondaryColor,
                onTap: () {
                  setState(() {
                    cubit.isSourceSelected = true;
                  });
                  navigateTo(context, Routes.selectDestinationPage, extra: {
                    'cubit': cubit,
                  });
                },
              ),
              12.ph,
              CustomTextField(
                hint: S.of(context).dropoffLocation,
                controller: cubit.destinationController,
                isReadOnly: true,
                borderColor: !cubit.isSourceSelected
                    ? AppColors.greenColor
                    : AppColors.secondaryColor,
                onTap: () {
                  setState(() {
                    cubit.isSourceSelected = false;
                  });
                  navigateTo(context, Routes.selectDestinationPage, extra: {
                    'cubit': cubit,
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
