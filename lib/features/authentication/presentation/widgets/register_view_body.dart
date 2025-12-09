import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';

import '../../../../core/utils/shared_widgets/custom_text_field.dart';
import '../../../../core/utils/shared_widgets/phone_text_field.dart';
import '../../../../core/utils/validations.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../view_models/auth_cubit/auth_cubit.dart';
import '../widgets/register_button.dart';
import 'cities_drop_down.dart';
import 'have_an_account_widget.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? selectedCountryId;
  int? selectedCityId;
  int? selectedDistrictId;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    // phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<AuthCubit>().phoneController.text = widget.phoneNumber;
    context
        .read<AuthCubit>()
        .changeCompleteNumber(completeNumber: widget.phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: SvgPicture.asset(
              Assets.svgLogin,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          20.ph,
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: userNameController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validation.validateName(context),
                  prefix: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(Assets.svgUser),
                  ),
                  hint: S.of(context).userName,
                ),
                16.ph,
                PhoneTextField(
                  controller: context.read<AuthCubit>().phoneController,
                ),
                /*CustomTextField(
                  controller: phoneController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validation.validatePhone(context),
                  keyType: TextInputType.phone,
                  prefix: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(Assets.svgPhone),
                  ),
                  hint: S.of(context).mobileNumber,
                ),*/
                16.ph,
                CustomTextField(
                  controller: emailController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validation.validateEmail(context),
                  keyType: TextInputType.emailAddress,
                  prefix: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(Assets.svgEmail),
                  ),
                  hint: S.of(context).email,
                ),
                16.ph,
                CitiesDropDown(
                  onCountrySelected: (countryId) {
                    setState(() {
                      selectedCountryId = countryId;
                    });
                  },
                  onCitySelected: (cityId) {
                    setState(() {
                      selectedCityId = cityId;
                    });
                  },
                  onDistrictSelected: (districtId) {
                    setState(() {
                      selectedDistrictId = districtId;
                    });
                  },
                ),
                30.ph,
                RegisterButton(
                    userNameController: userNameController,
                    emailController: emailController,
                    formKey: formKey),
                HaveAnAccountWidget(),
                24.ph
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ),
        ],
      ),
    );
  }
}
