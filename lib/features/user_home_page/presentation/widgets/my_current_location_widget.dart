import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCurrentLocationWidget extends StatelessWidget {
  MyCurrentLocationWidget({super.key, required this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "My Location",
      mini: true,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.gps_fixed,
        color: Colors.black,
        size: 30.w,
      ),
    );
  }
}
