import 'package:flutter/material.dart';

import '../../../../core/utils/common_use.dart';
import '../widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key, required this.phoneNumber});

  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    print("${phoneNumber}aa=============================");
    
    return Scaffold(
      appBar: buildAppBar(context),
      body: RegisterViewBody(
        phoneNumber: phoneNumber,
      ),
    );
  }
}
