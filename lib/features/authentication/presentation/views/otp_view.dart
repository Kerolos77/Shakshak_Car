import 'package:flutter/material.dart';

import '../../../../core/utils/common_use.dart';
import '../widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: OtpViewBody(),
    );
  }
}
