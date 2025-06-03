import 'package:flutter/material.dart';

import '../../../../core/utils/common_use.dart';
import '../widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: RegisterViewBody(),
    );
  }
}
