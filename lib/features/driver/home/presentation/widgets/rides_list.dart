import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import '../../../outstation/presentation/widgets/driver_rides_list_item.dart';

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
