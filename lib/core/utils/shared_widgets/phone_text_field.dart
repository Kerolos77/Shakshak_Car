import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../generated/l10n.dart';
import '../../resources/app_colors.dart';
import '../styles.dart';

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
    return IntlPhoneField(
      textAlign: TextAlign.start,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        fillColor: Colors.white,
        filled: true,
        hintText: S.of(context).mobileNumber,
        hintStyle: Styles.textStyle16Medium,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.secondaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.dm),
          ),
        ),
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
      /*pickerDialogStyle: PickerDialogStyle(
          backgroundColor: Colors.white,
          listTileDivider: Divider(
            color: AppColors.secondaryColor,
            height: 0,
          )),*/
      languageCode: "en",
      // Set the default language; can be localized if needed
      initialCountryCode: "EG",
      // Set the default country code
      /*  countries: const [
        Country(
          name: "Saudi Arabia",
          nameTranslations: {
            "sk": "Saudská Arábia",
            "se": "Saudi-Arábia",
            "pl": "Arabia Saudyjska",
            "no": "Saudi-Arabia",
            "ja": "サウジアラビア",
            "it": "Arabia Saudita",
            "zh": "沙特阿拉伯",
            "nl": "Saoedi-Arabië",
            "de": "Saudi-Arabien",
            "fr": "Arabie saoudite",
            "es": "Arabia Saudí",
            "en": "Saudi Arabia",
            "pt_BR": "Arábia Saudita",
            "sr-Cyrl": "Саудијска Арабија",
            "sr-Latn": "Saudijska Arabija",
            "zh_TW": "沙烏地阿拉",
            "tr": "Suudi Arabistan",
            "ro": "Arabia Saudită",
            "ar": "السعودية",
            "fa": "عربستان سعودی",
            "yue": "沙地阿拉伯"
          },
          flag: "🇸🇦",
          code: "SA",
          dialCode: "966",
          minLength: 9,
          maxLength: 9,
        ),
      ],*/

      onChanged: (phone) {
        /*BlocProvider.of<AuthCubit>(context)
            .changeCompleteNumber(completeNumber: phone.completeNumber);
        print(BlocProvider.of<AuthCubit>(context).completeNumber);*/
      },
    );
  }
}
