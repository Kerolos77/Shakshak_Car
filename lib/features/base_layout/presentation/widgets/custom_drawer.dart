import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/view_models/drawer_cubit/drawer_cubit.dart';

import 'driver_drawer_list_items.dart';
import 'user_drawer_list_items.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        final cubit = context.read<DrawerCubit>();
        final selectedIndex = cubit.selectedDrawerItemIndex;
        return Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 40.r,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 60.r,
                      ),
                    ),
                    6.ph,
                    Text(
                      'Mostafa',
                      style: Styles.textStyle16SemiBold,
                    ),
                    Text(
                      'mostafa@gmail.com',
                      style: Styles.textStyle16SemiBold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              CacheHelper.getData(key: AppConstant.kRoleSelection) == 'user'
                  ? UserDrawerListItems(
                      selectedIndex: selectedIndex, cubit: cubit)
                  : DriverDrawerListItems(
                      selectedIndex: selectedIndex, cubit: cubit),
            ],
          ),
        );
      },
    );
  }
}
