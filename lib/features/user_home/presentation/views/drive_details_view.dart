import 'package:flutter/material.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/user_home/presentation/widgets/drive_details_view_body.dart';

class DriveDetailsView extends StatelessWidget {
  const DriveDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: 'عرض الخريطة',
      body: const OrderDetailsViewBody(),
      horizontalPadding: 0,
      topPadding: 0,
    );
  }
}
