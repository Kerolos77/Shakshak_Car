import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/styles.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../../../../core/utils/shared_widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/place_model.dart';
import '../view_models/user_home_cubit/user_home_cubit.dart';
import '../view_models/user_home_cubit/user_home_states.dart';
import 'title_with_close_button.dart';

class SelectDestinationWidget extends StatefulWidget {
  const SelectDestinationWidget({
    super.key,
    required this.changeMapTap,
  });

  final Function()? changeMapTap;

  @override
  State<SelectDestinationWidget> createState() =>
      _SelectDestinationWidgetState();
}

class _SelectDestinationWidgetState extends State<SelectDestinationWidget> {
  @override
  Widget build(BuildContext context) {
    UserHomeCubit cubit = UserHomeCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              children: [
                const TitleWithCloseButton(title: "Select Address"),
                20.ph,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 24.r,
                          width: 24.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                        ),
                        SizedBox(height: 50.h, child: const VerticalDivider()),
                        Container(
                          height: 24.r,
                          width: 24.r,
                          padding: EdgeInsets.all(1.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Icon(Icons.place,
                              color: Colors.white, size: 16.r),
                        ),
                      ],
                    ),
                    12.pw,
                    Expanded(
                      child: Column(
                        children: [
                          CustomTextField(
                            hint: S.of(context).pickupLocation,
                            controller: cubit.sourceController,
                            borderColor: cubit.isSourceSelected
                                ? AppColors.greenColor
                                : AppColors.secondaryColor,
                            onTap: () {
                              setState(() {
                                cubit.isSourceSelected = true;
                              });
                            },
                          ),
                          12.ph,
                          CustomTextField(
                            hint: S.of(context).pickupLocation,
                            controller: cubit.destinationController,
                            borderColor: !cubit.isSourceSelected
                                ? AppColors.greenColor
                                : AppColors.secondaryColor,
                            onTap: () {
                              setState(() {
                                cubit.isSourceSelected = false;
                              });
                            },
                            onchange: (value) {
                              cubit.getPlacesSuggestions(value!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                10.ph,
                BlocBuilder<UserHomeCubit, UserHomeState>(
                  builder: (context, state) {
                    cubit = context.read<UserHomeCubit>();
                    if (state is SuggestionsLoadedState &&
                        cubit.placePredictions.isNotEmpty) {
                      return buildSuggestionsList(cubit.placePredictions);
                    }
                    return InkWell(
                      onTap: widget.changeMapTap,
                      child: Row(
                        children: [
                          Icon(Icons.add_location_alt,
                              color: AppColors.primaryColor),
                          10.pw,
                          Expanded(
                            child: Text(
                              "Choose on map",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.r),
        child: CustomButton(
          buttonColor: AppColors.primaryColor,
          onTap: () {
            Navigator.of(context).pop();
          },
          text: 'Confirm Destination',
        ),
      ),
    );
  }

  Widget buildSuggestionsList(List<PlacePrediction> suggestions) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.direction != ScrollDirection.idle) {
          FocusScope.of(context).unfocus(); // يقفل الكيبورد أول ما تبدأ سكروول
        }
        return false;
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: suggestions.length + 1, // +1 علشان "Choose on map"
        itemBuilder: (context, index) {
          if (index < suggestions.length) {
            final place = suggestions[index];
            return InkWell(
              onTap: () {
                UserHomeCubit.get(context).selectPlace(
                    placeId: place.placeId,
                    isSource: UserHomeCubit.get(context).isSourceSelected);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey[600]),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(place.placeName!,
                              style: Styles.textStyle16Bold(context)),
                          Text(place.description,
                              style: Styles.textStyle12(context)
                                  .copyWith(color: AppColors.greyColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // آخر عنصر: Choose on map
            return InkWell(
              onTap: widget.changeMapTap,
              child: Row(
                children: [
                  Icon(Icons.add_location_alt, color: AppColors.primaryColor),
                  10.pw,
                  Expanded(
                    child: Text(
                      "Choose on map",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
