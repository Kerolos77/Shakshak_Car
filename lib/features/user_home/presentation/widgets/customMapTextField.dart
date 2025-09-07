import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import '../../../../core/constants/key_const.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/utils/styles.dart';


class CustomMapTextField extends StatefulWidget {
  const CustomMapTextField({
    super.key,
    this.hint,
    this.suffix,
    this.prefix,
    this.onchange,
    this.label,
    this.obscure = false,
    this.keyType,
    this.maxLiens = 1,
    this.borderColor = AppColors.secondaryColor,
    this.controller,
    this.onItemClick,
    this.getPlaceDetailWithLatLng,
    this.initial,
    this.inputFormatters,
    this.borderRadius = 16,
    this.topPadding = 8,
    this.hintColor = AppColors.greyColor,
    this.validator,
    this.width,
    this.fill = true,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.isReadOnly = false,
  });

  final String? hint;
  final String? Function(String? value)? validator;
  final int? maxLiens;
  final Widget? suffix, prefix;
  final String? label;
  final bool obscure;

  final bool fill;

  final void Function(String?)? onchange;
  final TextInputType? keyType;
  final Color? borderColor, hintColor;
  final TextEditingController? controller;
  final String? initial;
  final void Function(Prediction)? onItemClick;
  final void Function(Prediction)? getPlaceDetailWithLatLng;
  final List<TextInputFormatter>? inputFormatters;
  final double topPadding;
  final double borderRadius;
  final double? width;
  final AutovalidateMode? autoValidateMode;
  final bool isReadOnly;

  @override
  State<CustomMapTextField> createState() => _CustomMapTextFieldState();
}

class _CustomMapTextFieldState extends State<CustomMapTextField> {
  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: widget.controller!,
      googleAPIKey:KeyConst.mapKey,
      inputDecoration: buildInputDecoration(),
      debounceTime: 400,
      countries: ["eg"],
      isLatLngRequired: true,
      getPlaceDetailWithLatLng: widget.getPlaceDetailWithLatLng,
      itemClick: widget.onItemClick,

    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius.r),
        borderSide:  BorderSide(
            color: widget.borderColor!, style: BorderStyle.solid));
  }
  InputDecoration buildInputDecoration(){
    return InputDecoration(
      fillColor: Theme.of(context).colorScheme.surface,
      filled: true,
      enabledBorder: buildOutlineInputBorder(),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          borderSide: const BorderSide(
              color: AppColors.redColor, style: BorderStyle.solid)),
      border: buildOutlineInputBorder(),
      focusedBorder: buildOutlineInputBorder(),
      contentPadding:
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: widget.suffix,
      prefixIcon: widget.prefix,
      hintText: widget.hint,
      hintStyle: Styles.textStyle16Medium(context).copyWith(color: Theme.of(context).hintColor),
      labelStyle: Styles.textStyle16SemiBold(context).copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }

}
