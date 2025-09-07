import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_drop_down.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/router_helper.dart';
import '../../../../core/router/routes.dart';
import '../../../../generated/l10n.dart';
import '../view_models/user_home_cubit/user_home_cubit.dart';
import '../view_models/user_home_cubit/user_home_states.dart';
import '../widgets/select_vehicle_section.dart';
import '../widgets/user_home_header.dart';

class UserHomeView extends StatefulWidget {
   UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider (
      create: (context) => UserHomeCubit()..getMyLocation(),
    child:  BlocConsumer<UserHomeCubit, UserHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserHomeCubit.get(context);
        print("controller: ${cubit.sourceController!.text}");
        return  BaseLayoutView(
          header: const UserHomeHeader(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  S.of(context).whereYouWantToGo,
                  style: Styles.textStyle20Bold(context),
                ),
                6.ph,
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 24.r),
                      8.pw,
                      Expanded(
                        child: Text(
                          S.of(context).loremMessage,
                          style: Styles.textStyle16(context).copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      8.pw,
                      Icon(Icons.chevron_right,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 28.r),
                    ],
                  ),
                ),
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
                          child: Icon(Icons.place, color: Colors.white, size: 16.r),
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
                            isReadOnly: true,
                            borderColor: cubit.isSourceSelected ?AppColors.greenColor:AppColors.secondaryColor,

                            onTap: (){
                              setState(() {
                                cubit.isSourceSelected= true;
                              });
                              navigateTo(context, Routes.selectDestinationPage, extra: {
                                'cubit': cubit,
                              });
                            },
                          ),
                          12.ph,
                          CustomTextField(
                              hint: S.of(context).dropoffLocation,
                              controller: cubit.destinationController,
                            isReadOnly: true,
                            borderColor: !cubit.isSourceSelected ?AppColors.greenColor:AppColors.secondaryColor,
                            onTap: (){
                              setState(() {
                                cubit.isSourceSelected= false;
                              });
                              navigateTo(context, Routes.selectDestinationPage, extra: {
                                'cubit': cubit,
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                20.ph,
                const SelectVehicleSection(),
                20.ph,
                CustomTextField(hint: S.of(context).enterOfferRate),
                20.ph,
                CustomDropDown(
                  items: [S.of(context).cash, S.of(context).wallet],
                  onChange: (method) {
                    // handle method change
                  },
                  hint: S.of(context).selectPaymentMethod,
                ),
                20.ph,
                CustomButton(
                  text: S.of(context).bookRide,
                  onTap: () {
                    // Trigger booking logic
                  },
                ),
                20.ph,
              ],
            ),
          ),
        );
      },
    ),
    );
  }
}
