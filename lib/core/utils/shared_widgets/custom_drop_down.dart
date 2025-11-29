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
            style: Styles.textStyle16SemiBold(context),
          ),
          6.ph,
        ],
        Stack(
          children: [
            Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
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
                dropdownColor: Theme.of(context).colorScheme.surface,
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
                  fillColor: Theme.of(context).colorScheme.surface,
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
                      style: Styles.textStyle18SemiBold(context).copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
                      value ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: onChange,
                hint: Text(
                  hint,
                  textAlign: TextAlign.start,
                  style: Styles.textStyle16Medium(context).copyWith(color: Theme.of(context).hintColor),
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
