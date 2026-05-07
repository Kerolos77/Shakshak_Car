import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/services/service_locator.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_cached_network_image.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_loading_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/shared_widgets/show_snack_bar.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/shared/authentication/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shakshak/features/shared/authentication/presentation/view_models/country_city_cubit/countries_cities_cubit.dart';
import 'package:shakshak/features/shared/authentication/presentation/widgets/cities_drop_down.dart';
import 'package:shakshak/features/shared/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/shared/review/presentation/view_models/review_cubit.dart';
import 'package:shakshak/features/shared/review/presentation/views/user_reviews_view.dart';
import 'package:shakshak/features/shared/rides/presentation/view_models/rides_cubit.dart';
import 'package:shakshak/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _phoneController = TextEditingController();
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
    // _phoneController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    context.read<AuthCubit>().updateProfile(
          name: _userNameController.text,
          email: _emailController.text,
          countryId: _selectedCountryId ?? 02,
          cityId: _selectedCityId!,
          photo: image,
        );
  }

  void _onCountrySelected(int countryId) {
    setState(() {
      _selectedCountryId = countryId;
      _selectedCityId = null; // Reset city when country changes
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
            // Row of Stat Cards
            Row(
              children: [
                Expanded(
                    child: _buildNewStatCard(context, '00', 'Rides',
                        Icons.directions_car, Colors.grey)),
                12.pw,
                Expanded(
                    child: _buildNewStatCard(
                        context, '0.0', 'Rating', Icons.star, Colors.grey)),
                12.pw,
                Expanded(
                    child: _buildNewStatCard(context, '00.0', 'Wallet',
                        Icons.account_balance_wallet, Colors.grey)),
              ],
            ),
            25.ph,
            // Form Container
            Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Column(
                children: [
                  _buildModernField(
                    controller: _userNameController,
                    label: S.of(context).userName,
                    icon: Icons.person_outline_rounded,
                  ),
                  20.ph,
                  _buildModernField(
                    controller: _emailController,
                    label: S.of(context).email,
                    icon: Icons.alternate_email_rounded,
                  ),
                  20.ph,
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  32.ph,
                  CustomButton(
                      text: S.of(context).save, height: 60, borderRadius: 20),
                ],
              ),
            ),
            40.ph,
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer Ring
                    Container(
                      width: 140.r,
                      height: 140.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          width: 2,
                        ),
                      ),
                    ),
                    // Avatar Container
                    Container(
                      width: 120.r,
                      height: 120.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.r),
                        child: image != null
                            ? Image.file(image!, fit: BoxFit.cover)
                            : (profilePhotoUrl.isNotEmpty
                                ? CustomCachedNetworkImage(
                                    imgUrl: profilePhotoUrl,
                                    width: 120.r,
                                    height: 120.r,
                                    errorIconSize: 40,
                                  )
                                : Container(
                                    color: Colors.grey.shade50,
                                    child: Icon(Icons.person_rounded,
                                        size: 60.r,
                                        color: Colors.grey.shade300),
                                  )),
                      ),
                    ),
                    // Edit Button
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () async {
                          final XFile? pickedFile = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {
                            setState(() {
                              image = File(pickedFile.path);
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.surface,
                                width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(Icons.edit_rounded,
                              size: 16.r, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.ph,
              Text(
                _userNameController.text,
                style: Styles.textStyle22Bold(context).copyWith(
                  letterSpacing: -0.5,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              4.ph,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  _emailController.text,
                  style: Styles.textStyle14SemiBold(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              25.ph,
            ],
          );
        },
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ReviewCubit(sl(), sl()),
          ),
          BlocProvider(
            create: (context) => RidesCubit(sl()),
          ),
        ],
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is GetProfileSuccessState) {
              _userNameController.text = state.userModel.data?.name ?? '';
              _emailController.text = state.userModel.data?.email ?? '';
              profilePhotoUrl = state.userModel.data?.image ?? '';
              _selectedCountryId = state.userModel.data?.countryId;
              _selectedCityId = state.userModel.data?.city;

              final userId = state.userModel.data?.id ?? 0;
              final isDriver = state.userModel.data?.isDriver == 1;
              context.read<ReviewCubit>().fetchUserReviews(userId: userId);
              context
                  .read<RidesCubit>()
                  .getRides(inCity: 1, isDriver: isDriver);
            } else if (state is UpdateProfileSuccessState) {
              showSnackBar(
                context,
                S.of(context).profileUpdatedSuccessfully,
                S.of(context).doneSuccessfully,
                AppColors.primaryColor,
                ContentType.success,
              );
              context.read<AuthCubit>().getProfile();
            } else if (state is UpdateProfileFailureState) {
              showSnackBar(
                  context,
                  state.errMessage,
                  S.of(context).errorOccurred,
                  AppColors.redColor,
                  ContentType.failure);
            }
          },
          builder: (context, state) {
            if (state is GetProfileLoadingState) {
              return _buildSkeletonLoader();
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    final authCubit = context.watch<AuthCubit>();
                    final walletAmount =
                        authCubit.profileModel?.data?.walletAmount ?? '0.0';

                    return Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<RidesCubit, RidesState>(
                            builder: (context, state) {
                              String ridesCount = '0';
                              if (state is RidesSuccess) {
                                final data = state.ridesEntity.data;
                                if (data != null) {
                                  final total = (data.searching?.length ?? 0) +
                                      (data.placed?.length ?? 0) +
                                      (data.started?.length ?? 0) +
                                      (data.completed?.length ?? 0) +
                                      (data.canceled?.length ?? 0);
                                  ridesCount = total.toString();
                                }
                              } else if (state is RidesLoading) {
                                ridesCount = '...';
                              }
                              return _buildNewStatCard(
                                context,
                                ridesCount,
                                S.of(context).rides,
                                Icons.directions_car_filled_rounded,
                                AppColors.primaryColor,
                              );
                            },
                          ),
                        ),
                        12.pw,
                        Expanded(
                          child: BlocBuilder<ReviewCubit, ReviewState>(
                            builder: (context, state) {
                              String rating = '0.0';
                              int userId = 0;
                              String userName = '';
                              if (state is UserReviewSuccess) {
                                rating = state
                                    .userReviewResponse.data.user.averageRating
                                    .toStringAsFixed(1);
                                userId = state.userReviewResponse.data.user.id;
                                userName =
                                    state.userReviewResponse.data.user.name;
                              } else if (state is ReviewLoading) {
                                rating = '...';
                              }
                              return GestureDetector(
                                onTap: () {
                                  if (userId != 0) {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => UserReviewsView(
                                        userId: userId,
                                        userName: userName,
                                      ),
                                    );
                                  }
                                },
                                child: _buildNewStatCard(
                                  context,
                                  rating,
                                  S.of(context).status,
                                  Icons.star_rounded,
                                  const Color(0xFFFFB800),
                                ),
                              );
                            },
                          ),
                        ),
                        12.pw,
                        Expanded(
                          child: _buildNewStatCard(
                            context,
                            walletAmount,
                            S.of(context).wallet,
                            Icons.account_balance_wallet_rounded,
                            const Color(0xFF10B981),
                          ),
                        ),
                      ],
                    );
                  }),
                  25.ph,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, bottom: 12.h),
                    child: Text(
                      S.of(context).profile,
                      style: Styles.textStyle16Bold(context),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(24.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.02),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildModernField(
                          controller: _userNameController,
                          label: S.of(context).userName,
                          icon: Icons.person_outline_rounded,
                        ),
                        20.ph,
                        _buildModernField(
                          controller: _emailController,
                          label: S.of(context).email,
                          icon: Icons.alternate_email_rounded,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        20.ph,
                        10.ph,
                        BlocProvider(
                          create: (context) => CountriesCitiesCubit(
                              getCountriesUseCase: sl(),
                              getCitiesUseCase: sl()),
                          child: CitiesDropDown(
                            enabled: true,
                            initialCountryId: _selectedCountryId,
                            initialCityId: _selectedCityId,
                            onCountrySelected: _onCountrySelected,
                            onCitySelected: _onCitySelected,
                          ),
                        ),
                        32.ph,
                        state is UpdateProfileLoadingState
                            ? const CustomLoadingButton()
                            : CustomButton(
                                text: S.of(context).save,
                                onTap: _updateProfile,
                                height: 60,
                                borderRadius: 20,
                                buttonColor: AppColors.primaryColor,
                              ),
                      ],
                    ),
                  ),
                  40.ph,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNewStatCard(BuildContext context, String value, String label,
      IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border:
            Border.all(color: Theme.of(context).dividerColor.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20.r, color: color),
          ),
          10.ph,
          Text(value, style: Styles.textStyle18Bold(context)),
          2.ph,
          Text(
            label,
            style: Styles.textStyle12SemiBold(context).copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
          child: Text(
            label,
            style: Styles.textStyle14SemiBold(context).copyWith(
              color: Theme.of(context).hintColor.withOpacity(0.8),
            ),
          ),
        ),
        CustomTextField(
          controller: controller,
          hint: label,
          keyType: keyboardType,
          prefix: Icon(icon, size: 20.r, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
