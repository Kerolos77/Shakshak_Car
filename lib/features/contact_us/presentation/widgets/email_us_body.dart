import 'package:flutter/material.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/generated/l10n.dart';

class EmailUsBody extends StatelessWidget {
  const EmailUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).writeUs,
          style: Styles.textStyle20Bold,
        ),
        Text(
          S.of(context).describeIssue,
          style: Styles.textStyle16,
        ),
        16.ph,
        CustomTextField(
          hint: S.of(context).email,
        ),
        12.ph,
        CustomTextField(
          hint: S.of(context).describeFeedback,
          maxLiens: 6,
        ),
        20.ph,
        CustomButton(
          text: S.of(context).submit,
        ),
        20.ph,
      ],
    );
  }
}
