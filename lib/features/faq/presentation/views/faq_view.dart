import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/generated/l10n.dart';

import '../widgets/faq_item.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).faqs,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).writeUs,
            style: Styles.textStyle20Bold(context),
          ),
          Text(
            S.of(context).describeIssue,
            style: Styles.textStyle16(context),
          ),
          16.ph,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
              itemBuilder: (context, index) => const FaqItem(),
              separatorBuilder: (context, index) => 12.ph,
              itemCount: 8,
            ),
          )
        ],
      ),
    );
  }
}
