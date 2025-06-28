import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../generated/l10n.dart';
import '../widgets/wallet_transaction_item.dart';

class WithdrawHistoryView extends StatelessWidget {
  const WithdrawHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).withdrawRequests,
      horizontalPadding: 0,
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          itemBuilder: (context, index) => WalletTransactionItem(),
          separatorBuilder: (context, index) => 16.ph,
          itemCount: 6),
    );
  }
}
