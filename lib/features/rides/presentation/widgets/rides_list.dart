import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/features/driver/outstation/presentation/widgets/driver_rides_list_item.dart';

class RidesList extends StatelessWidget {
  const RidesList({super.key, this.isOutstation = false});

  final bool isOutstation;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      itemCount: 3,
      itemBuilder: (context, index) => DriverRidesListItem(
        isOutstation: isOutstation,
      ),
      separatorBuilder: (context, index) => 16.ph,
    );
  }
}
