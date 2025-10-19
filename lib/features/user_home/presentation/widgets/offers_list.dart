import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_loading_button.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/user_home/presentation/view_models/user_home_cubit.dart';

import '../../../../generated/l10n.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<UserHomeCubit, UserHomeState>(
        buildWhen: (previous, current) =>
            current is OffersUpdated ||
            current is AcceptOfferLoading ||
            current is AcceptOfferSuccess ||
            current is AcceptOfferFailure,
        builder: (context, state) {
          final cubit = context.read<UserHomeCubit>();
          final offers = cubit.offers;

          return ListView.separated(
            itemCount: offers.length,
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 10.w, vertical: 10.h),
            separatorBuilder: (context, index) => 12.ph,
            itemBuilder: (context, index) {
              final offer = offers[index];

              return Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: AppConstant.shadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22.r,
                          backgroundColor: Colors.black12,
                          child: Icon(Icons.person, color: Colors.black54),
                        ),
                        10.pw,
                        Expanded(
                          child: Text(
                            'User $offer',
                            style: Styles.textStyle16SemiBold(context),
                          ),
                        ),
                        Text(
                          '70.00 جنيه',
                          style: Styles.textStyle16Bold(context),
                        ),
                      ],
                    ),
                    12.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.color_lens, size: 20.r),
                            4.pw,
                            Text(
                              'red',
                              style: Styles.textStyle14SemiBold(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Acura CL Models (4)',
                              style: Styles.textStyle14SemiBold(context),
                            ),
                            4.pw,
                            Icon(Icons.directions_car, size: 20.r),
                          ],
                        ),
                      ],
                    ),
                    12.ph,
                    Row(
                      children: [
                        Expanded(
                          child: BlocConsumer<UserHomeCubit, UserHomeState>(
                            listener: (context, state) {
                              if (state is AcceptOfferSuccess) {
                              } else if (state is AcceptOfferFailure) {}
                            },
                            builder: (context, state) {
                              final isLoading = state is AcceptOfferLoading &&
                                  state.index == index;

                              if (isLoading) {
                                return CustomLoadingButton(
                                  height: 40,
                                  borderRadius: 8,
                                );
                              } else {
                                return CustomButton(
                                  text: S.of(context).accept,
                                  height: 40,
                                  borderRadius: 8,
                                  onTap: () {
                                    context.read<UserHomeCubit>().acceptOffer(
                                          orderId: 707,
                                          driverId: 1,
                                          index: index,
                                        );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        10.pw,
                        Expanded(
                          child: CustomButton(
                            text: S.of(context).reject,
                            height: 40,
                            borderRadius: 8,
                            buttonColor: Colors.white,
                            textColor: AppColors.primaryColor,
                            borderColor: AppColors.primaryColor,
                            onTap: () {
                              context.read<UserHomeCubit>().rejectOffer(index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
