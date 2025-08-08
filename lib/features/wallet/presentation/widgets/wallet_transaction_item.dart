import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';

import '../../../../core/utils/common_use.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/wallet_transactions_model.dart';

class WalletTransactionItem extends StatefulWidget {
  const WalletTransactionItem({super.key, required this.walletTransactionData});

  final WalletTransactionData walletTransactionData;

  @override
  State<WalletTransactionItem> createState() => _WalletTransactionItemState();
}

class _WalletTransactionItemState extends State<WalletTransactionItem> {
  final ExpandableController expandableController = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: expandableController,
      header: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppConstant.shadow,
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightGreyColor,
                  radius: 20.r,
                  child: Icon(
                    Icons.wallet,
                    color: Colors.black,
                    size: 24.r,
                  ),
                ),
                12.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+${widget.walletTransactionData.amount ?? 0} EGP',
                        style: Styles.textStyle14Bold(context).copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      Text(
                        widget.walletTransactionData.type ?? '',
                        style: Styles.textStyle14Bold(context),
                      ),
                    ],
                  ),
                ),
                8.pw,
                IconButton(
                  onPressed: () {
                    setState(() {
                      expandableController.expanded =
                          !expandableController.expanded;
                    });
                  },
                  icon: Icon(
                    expandableController.expanded == false
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      collapsed: SizedBox(),
      expanded: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 10.h,
            ),
            padding: EdgeInsets.symmetric(),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: AppConstant.shadow,
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).transactionId,
                        style: Styles.textStyle14Bold(context),
                      ),
                      Text(
                        '#${widget.walletTransactionData.paymentId ?? ''}',
                        style: Styles.textStyle14(context),
                      ),
                    ],
                  ),
                  4.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).paidVia,
                        style: Styles.textStyle14Bold(context),
                      ),
                      Text(
                        widget.walletTransactionData.paymentMethod ?? '',
                        style: Styles.textStyle14(context),
                      ),
                    ],
                  ),
                  4.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).date,
                        style: Styles.textStyle14Bold(context),
                      ),
                      Text(
                        formatCustomDate(
                            widget.walletTransactionData.createdAt ?? ''),
                        style: Styles.textStyle14(context),
                      ),
                    ],
                  ),
                  4.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).status,
                        style: Styles.textStyle14Bold(context),
                      ),
                      Text(
                        widget.walletTransactionData.status ?? '',
                        style: Styles.textStyle14(context),
                      ),
                    ],
                  ),
                  10.ph,
                ],
              ),
            ),
          ),
          8.ph,
        ],
      ).paddingSymmetric(horizontal: 12.w),
      theme: ExpandableThemeData(
        hasIcon: false,
        iconColor: AppColors.primaryColor,
        tapBodyToExpand: false,
        tapBodyToCollapse: false,
        tapHeaderToExpand: false,
        iconSize: 26.r,
      ),
    );
  }
}
