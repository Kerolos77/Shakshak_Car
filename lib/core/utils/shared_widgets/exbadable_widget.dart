import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../styles.dart';

class ExpandableMissionWidget extends StatefulWidget {
  final String missionTitle;
  final String coinImg;
  final bool isExpandedInitially;

  const ExpandableMissionWidget({
    Key? key,
    required this.missionTitle,
    required this.coinImg,
    this.isExpandedInitially = false,
  }) : super(key: key);

  @override
  _ExpandableMissionWidgetState createState() =>
      _ExpandableMissionWidgetState();
}

class _ExpandableMissionWidgetState extends State<ExpandableMissionWidget> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpandedInitially;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        width: isExpanded ? 200.r : 30.r,
        height: 35.r,
        child: Row(
          children: [
            SvgPicture.asset(
              widget.coinImg,
              height: 32.r,
              width: 32.r,
            ),
            if (isExpanded)
              SizedBox(
                width: 10.w,
              ),
            if (isExpanded)
              Expanded(
                child: Text(
                  widget.missionTitle,
                  style: Styles.textStyle10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
