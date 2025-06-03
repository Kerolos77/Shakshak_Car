import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import 'rides_list_item.dart';

class RidesListView extends StatelessWidget {
  const RidesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      itemCount: 3,
      itemBuilder: (context, index) => RidesListItem(),
      separatorBuilder: (context, index) => 16.ph,
    );
  }
}
