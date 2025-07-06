import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_loading_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/validations.dart';
import 'package:shakshak/features/authentication/data/repo/auth_repo.dart';
import 'package:shakshak/features/authentication/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shakshak/features/authentication/presentation/view_models/country_city_cubit/countries_cities_cubit.dart';
import 'package:shakshak/features/authentication/presentation/widgets/cities_drop_down.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/app_const.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/shared_widgets/custom_cached_network_image.dart';
import '../../../../core/utils/shared_widgets/show_snack_bar.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int? _selectedCountryId;
  int? _selectedCityId;
  String profilePhotoUrl = '';

  ImagePicker imagePicker = ImagePicker();
  File? image;
  XFile? xFilePhoto;

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getProfile();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    context.read<AuthCubit>().updateProfile(
          name: _userNameController.text,
          email: _emailController.text,
          countryId: _selectedCountryId!,
          cityId: _selectedCityId!,
          photo: image,
        );
  }

  void _onCountrySelected(int countryId) {
    setState(() {
      _selectedCountryId = countryId;
    });
  }

  void _onCitySelected(int cityId) {
    setState(() {
      _selectedCityId = cityId;
    });
  }

  Widget _buildSkeletonLoader() {
    return Skeletonizer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              controller: _userNameController,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: Validation.validateName(context),
              prefix: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(Assets.svgUser),
              ),
              hint: S.of(context).userName,
            ),
            12.ph,
            CustomTextField(
              controller: _phoneController,
              isReadOnly: true,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: Validation.validatePhone(context),
              keyType: TextInputType.phone,
              prefix: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(Assets.svgPhone),
              ),
              hint: S.of(context).mobileNumber,
            ),
            12.ph,
            CustomTextField(
              controller: _emailController,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: Validation.validateEmail(context),
              keyType: TextInputType.emailAddress,
              prefix: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(Assets.svgEmail),
              ),
              hint: S.of(context).email,
            ),
            12.ph,
            BlocProvider(
              create: (context) => CountriesCitiesCubit(sl<AuthRepo>()),
              child: CitiesDropDown(
                onCountrySelected: _onCountrySelected,
                onCitySelected: _onCitySelected,
              ),
            ),
            20.ph,
            CustomButton(
              text: S.of(context).updateProfile,
            ),
            20.ph
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).profile,
      header: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
            children: [
              Center(
                child: image != null
                    ? Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 120.r,
                            height: 120.r,
                            padding: EdgeInsets.all(
                              5.r,
                            ),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.file(
                                width: 120.r,
                                height: 120.r,
                                File(xFilePhoto!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5.w,
                            child: GestureDetector(
                              onTap: () async {
                                xFilePhoto = await imagePicker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  if (xFilePhoto != null) {
                                    image = File(xFilePhoto!.path);
                                  }
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20.r,
                                child: Icon(
                                  Icons.camera,
                                  color: Colors.black,
                                  size: 26.r,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 120.r,
                            height: 120.r,
                            padding: EdgeInsets.all(
                              5.r,
                            ),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: profilePhotoUrl != ''
                                ? Container(
                                    clipBehavior: Clip.hardEdge,
                                    height: 120.r,
                                    width: 120.r,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: AppConstant.shadow,
                                    ),
                                    child: Center(
                                      child: CustomCachedNetworkImage(
                                        imgUrl: profilePhotoUrl,
                                        width: 120.r,
                                        height: 120.r,
                                        loadingImgPadding: 16,
                                        errorIconSize: 50,
                                      ),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 40.r,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 70.r,
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5.w,
                            child: GestureDetector(
                              onTap: () async {
                                xFilePhoto = await imagePicker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  if (xFilePhoto != null) {
                                    image = File(xFilePhoto!.path);
                                  }
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20.r,
                                child: Icon(
                                  Icons.camera,
                                  color: Colors.black,
                                  size: 26.r,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              20.ph,
            ],
          );
        },
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is GetProfileSuccessState) {
            _userNameController.text = state.userModel.data?.name ?? '';
            _emailController.text = state.userModel.data?.email ?? '';
            _phoneController.text = state.userModel.data?.phone ?? '';
            profilePhotoUrl = state.userModel.data?.image ?? '';
            _selectedCountryId = state.userModel.data?.countryId;
            _selectedCityId = state.userModel.data?.city;
          } else if (state is UpdateProfileSuccessState) {
            showSnackBar(
                context,
                S.of(context).profileUpdatedSuccessfully,
                S.of(context).doneSuccessfully,
                AppColors.primaryColor,
                ContentType.success);

            context.read<AuthCubit>().getProfile();
          } else if (state is UpdateProfileFailureState) {
            showSnackBar(context, state.errMessage, S.of(context).errorOccurred,
                AppColors.redColor, ContentType.failure);
          } else if (state is GetProfileFailureState) {
            showSnackBar(context, state.errMessage, S.of(context).errorOccurred,
                AppColors.redColor, ContentType.failure);
          }
        },
        builder: (context, state) {
          if (state is GetProfileLoadingState) {
            return _buildSkeletonLoader();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: _userNameController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validation.validateName(context),
                  prefix: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(Assets.svgUser),
                  ),
                  hint: S.of(context).userName,
                ),
                12.ph,
                CustomTextField(
                  controller: _phoneController,
                  isReadOnly: true,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validation.validatePhone(context),
                  keyType: TextInputType.phone,
                  prefix: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(Assets.svgPhone),
                  ),
                  hint: S.of(context).mobileNumber,
                ),
                12.ph,
                CustomTextField(
                  controller: _emailController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validation.validateEmail(context),
                  keyType: TextInputType.emailAddress,
                  prefix: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(Assets.svgEmail),
                  ),
                  hint: S.of(context).email,
                ),
                12.ph,
                BlocProvider(
                  create: (context) => CountriesCitiesCubit(sl<AuthRepo>()),
                  child: CitiesDropDown(
                    initialCountryId: state is GetProfileSuccessState
                        ? state.userModel.data?.countryId
                        : null,
                    initialCityId: state is GetProfileSuccessState
                        ? state.userModel.data?.city
                        : null,
                    onCountrySelected: _onCountrySelected,
                    onCitySelected: _onCitySelected,
                  ),
                ),
                20.ph,
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is UpdateProfileLoadingState) {
                      return CustomLoadingButton();
                    } else {
                      return CustomButton(
                        text: S.of(context).updateProfile,
                        onTap: _updateProfile,
                      );
                    }
                  },
                ),
                20.ph
              ],
            ),
          );
        },
      ),
    );
  }
}
