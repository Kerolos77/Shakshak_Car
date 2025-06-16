import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import '../../../generated/assets.dart';
import '../../resources/app_colors.dart';
import '../styles.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final String hint;
  final double? borderRadius;
  final void Function(String?)? onChange;
  final String? value;
  final String? label;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final bool isExpanded;

  const CustomDropDown({
    super.key,
    required this.items,
    this.hint = '',
    this.borderRadius = 16,
    this.onChange,
    this.value,
    this.validator,
    this.label,
    this.prefix,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Styles.textStyle16SemiBold,
          ),
          6.ph,
        ],
        Stack(
          children: [
            Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius!),
                )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              child: DropdownButtonFormField(
                isExpanded: isExpanded,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validator,
                dropdownColor: Colors.white,
                icon: Padding(
                  padding: EdgeInsets.all(6.r),
                  child: SvgPicture.asset(
                    Assets.svgArrowDown,
                    width: 14.w,
                  ),
                ),
                iconSize: 35.r,
                menuMaxHeight: 160.h,
                value: value,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: prefix,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 16.w,
                  ),
                  focusedBorder: buildOutlineInputBorder(),
                  enabledBorder: buildOutlineInputBorder(),
                  border: buildOutlineInputBorder(),
                  disabledBorder: buildOutlineInputBorder(),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.redColor),
                    borderRadius: BorderRadius.circular(borderRadius!.r),
                  ),
                ),
                items: items.map((String? value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      style: Styles.textStyle18SemiBold,
                      value ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: onChange,
                hint: Text(
                  hint,
                  textAlign: TextAlign.start,
                  style: Styles.textStyle16Medium,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryColor),
      borderRadius: BorderRadius.circular(borderRadius!.r),
    );
  }
}
