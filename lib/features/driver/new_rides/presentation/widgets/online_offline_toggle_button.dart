import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/features/driver/home/presentation/view_models/driver_home_cubit.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';

class OnlineOfflineToggleButton extends StatefulWidget {
  const OnlineOfflineToggleButton({super.key});

  @override
  State<OnlineOfflineToggleButton> createState() =>
      _OnlineOfflineToggleButtonState();
}

class _OnlineOfflineToggleButtonState extends State<OnlineOfflineToggleButton> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOnline = !isOnline;
            context
                .read<DriverHomeCubit>()
                .driverToggleOnline(value: isOnline == true ? 1 : 0);
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 140.w,
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: AppConstant.shadow,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment:
                    isOnline ? Alignment.centerRight : Alignment.centerLeft,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: 48.r,
                  height: 32.r,
                  decoration: BoxDecoration(
                    color: isOnline ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    isOnline ? Icons.check : Icons.close,
                    color: Colors.white,
                    size: 20.r,
                  ),
                ),
              ),
              Align(
                alignment:
                    isOnline ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    isOnline ? S.of(context).online : S.of(context).offline,
                    style: Styles.textStyle16Bold(context).copyWith(
                      color: isOnline ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
