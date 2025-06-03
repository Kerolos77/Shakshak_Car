import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../generated/l10n.dart';
import '../widgets/wallet_transaction_item.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).myWallet,
      header: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).totalBalance,
                  style: Styles.textStyle14Bold.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '0.00 EGP',
                  style: Styles.textStyle20Bold.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
            child: Text(
              S.of(context).topupWallet,
              style: Styles.textStyle16Bold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          itemBuilder: (context, index) => WalletTransactionItem(),
          separatorBuilder: (context, index) => 16.ph,
          itemCount: 6),
    );
  }
}
