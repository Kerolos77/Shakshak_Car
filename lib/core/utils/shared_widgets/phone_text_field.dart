import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../features/authentication/presentation/view_models/auth_cubit/auth_cubit.dart';
import '../../../generated/l10n.dart';
import '../../resources/app_colors.dart';
import '../styles.dart';
import '../validations.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  String? completeNumber;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: Validation.validatePhone(context),
      builder: (fieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntlPhoneField(
              textAlign: TextAlign.start,
              controller: widget.controller,
              onChanged: (phone) {
                context
                    .read<AuthCubit>()
                    .changeCompleteNumber(completeNumber: phone.completeNumber);
                print(context.read<AuthCubit>().completeNumber);

                completeNumber = phone.completeNumber;
                fieldState.didChange(phone.number);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                fillColor: Colors.white,
                filled: true,
                hintText: S.of(context).mobileNumber,
                hintStyle: Styles.textStyle16Medium(context),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.dm),
                  ),
                ),
                errorText: fieldState.errorText,
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.dm),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.dm),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.dm),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.dm),
                  ),
                ),
              ),
              languageCode: "en",
              initialCountryCode: "EG",
            ),
          ],
        );
      },
    );
  }
}
