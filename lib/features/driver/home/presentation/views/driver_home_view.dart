import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../outstation/presentation/widgets/driver_rides_list_item.dart';

class DriverHomeView extends StatelessWidget {
  const DriverHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).rides,
      horizontalPadding: 0,
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: AppConstant.shadow,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: AppColors.darkGreyColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        dividerColor: Colors.transparent,
                        labelStyle: Styles.textStyle16Bold.copyWith(
                          fontFamily: 'Cairo',
                        ),
                        unselectedLabelStyle: Styles.textStyle16Bold.copyWith(
                          fontFamily: 'Cairo',
                        ),
                        tabs: [
                          /*  Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('New'),
                                6.pw,
                                Icon(Icons.list),
                              ],
                            ),
                          ),*/
                          Tab(text: S.of(context).newRide),
                          Tab(text: S.of(context).active),
                          Tab(text: S.of(context).completed),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  RidesList(),
                  RidesList(),
                  RidesList(),
                ],
              )),
            ],
          )),
    );
  }
}

class RidesList extends StatelessWidget {
  const RidesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemBuilder: (context, index) => DriverRidesListItem(
        isOutstation: false,
      ),
      separatorBuilder: (context, index) => 12.ph,
      itemCount: 5,
    );
  }
}
