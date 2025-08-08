import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/wallet/data/models/wallet_transactions_model.dart';
import 'package:shakshak/features/wallet/presentation/view_models/wallet_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/wallet_transaction_item.dart';

class WalletTransactionsList extends StatefulWidget {
  const WalletTransactionsList({
    super.key,
  });

  @override
  State<WalletTransactionsList> createState() => _WalletTransactionsListState();
}

class _WalletTransactionsListState extends State<WalletTransactionsList> {
  @override
  void initState() {
    super.initState();
    context.read<WalletCubit>().getWalletTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletTransactionsSuccess) {
          return state.walletTransactionsModel.data!.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    itemBuilder: (context, index) => WalletTransactionItem(
                      walletTransactionData:
                          state.walletTransactionsModel.data![index],
                    ),
                    separatorBuilder: (context, index) => 16.ph,
                    itemCount: state.walletTransactionsModel.data!.length,
                  ),
                )
              : Expanded(
                  child: Center(
                  child: Text(
                    'no data',
                    style: Styles.textStyle16Medium(context),
                  ),
                ));
        } else if (state is WalletTransactionsLoading) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemBuilder: (context, index) => Skeletonizer(
                  child: WalletTransactionItem(
                walletTransactionData: WalletTransactionData(
                    id: 66,
                    paymentId: "341463213",
                    status: "pending",
                    success: 0,
                    amount: "110.0",
                    paymentMethod: "card",
                    paymentGateway: "paymob",
                    userID: 45,
                    createdAt: "2025-06-11T12:21:42.000000Z",
                    updatedAt: "2025-06-11T12:21:42.000000Z",
                    type: "deposit",
                    note: "aaaa"),
              )),
              separatorBuilder: (context, index) => 16.ph,
              itemCount: 6,
            ),
          );
        } else if (state is WalletTransactionsFailure) {
          return Expanded(
              child: Center(
            child: Text(
              state.errorMessage,
              style: Styles.textStyle16Medium(context),
            ),
          ));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
