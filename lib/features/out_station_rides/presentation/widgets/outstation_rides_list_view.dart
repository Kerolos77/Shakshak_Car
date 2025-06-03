import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import 'outstation_rides_list_item.dart';

class OutstationRidesListView extends StatelessWidget {
  const OutstationRidesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      itemCount: 3,
      itemBuilder: (context, index) => OutstationRidesListItem(),
      separatorBuilder: (context, index) => 16.ph,
    );
  }
}
