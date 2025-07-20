import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/router/routes.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../generated/l10n.dart';
import '../widgets/wallet_transactions_list.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).myWallet,
      horizontalPadding: 0,
      header: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).totalBalance,
                  style: Styles.textStyle14Bold(context)
                      .copyWith(color: Colors.white),
                ),
                Text(
                  '0.00 EGP',
                  style: Styles.textStyle20Bold(context)
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _showTopupWalletBottomSheet,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                S.of(context).topupWallet,
                style: Styles.textStyle16Bold(context).copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
      body: Column(
        children: [
          WalletTransactionsList(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: S.of(context).withdraw,
                    buttonColor: Theme.of(context).colorScheme.surface,
                    textColor: Theme.of(context).primaryColor,
                    onTap: _showWithdrawBottomSheet,
                  ),
                ),
                12.pw,
                Expanded(
                  child: CustomButton(
                    text: S.of(context).withdrawalHistory,
                    buttonColor: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).primaryColor,
                    onTap: () {
                      navigateTo(context, Routes.withdrawHistoryView);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showTopupWalletBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.of(context).topupWallet,
                      style: Styles.textStyle18Bold(context)),
                  12.ph,
                  CustomTextField(
                    label: S.of(context).addTopupAmount,
                    hint: S.of(context).enterAmount,
                    keyType: TextInputType.number,
                  ),
                  24.ph,
                  CustomButton(text: S.of(context).topup),
                ],
              ),
            ),
            Positioned(
              right: 10.w,
              top: 10.h,
              child: IconButton(
                onPressed: () => navigatePop(context),
                icon: Icon(
                  Icons.highlight_remove_sharp,
                  color: AppColors.greyColor,
                  size: 32.r,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showWithdrawBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.of(context).withdraw,
                      style: Styles.textStyle18Bold(context)),
                  12.ph,
                  CustomTextField(
                    label: S.of(context).addWithdrawAmount,
                    hint: S.of(context).enterAmount,
                    keyType: TextInputType.number,
                  ),
                  12.ph,
                  CustomTextField(
                    hint: S.of(context).notes,
                    maxLiens: 3,
                  ),
                  24.ph,
                  CustomButton(text: S.of(context).withdrawal),
                ],
              ),
            ),
            Positioned(
              right: 10.w,
              top: 10.h,
              child: IconButton(
                onPressed: () => navigatePop(context),
                icon: Icon(
                  Icons.highlight_remove_sharp,
                  color: AppColors.greyColor,
                  size: 32.r,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
