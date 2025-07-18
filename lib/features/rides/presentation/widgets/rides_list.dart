import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/features/driver/outstation/presentation/widgets/driver_rides_list_item.dart';
import 'package:shakshak/features/rides/data/models/ride.dart';

class RidesList extends StatelessWidget {
  const RidesList({super.key, required this.rides, this.isOutstation = false});

  final List<Ride> rides;
  final bool isOutstation;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      itemCount: rides.length,
      itemBuilder: (context, index) => DriverRidesListItem(
        ride: rides[index],
        isOutstation: isOutstation,
      ),
      separatorBuilder: (context, index) => 16.ph,
    );
  }
}
