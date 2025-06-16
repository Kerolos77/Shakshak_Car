import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../generated/l10n.dart';
import '../widgets/custom_image_picker_widget.dart';

class CriminalRecordView extends StatefulWidget {
  const CriminalRecordView({super.key});

  @override
  State<CriminalRecordView> createState() => _CriminalRecordViewState();
}

class _CriminalRecordViewState extends State<CriminalRecordView> {
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).criminalRecord,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImagePickerWidget(
            title: S.of(context).frontSide,
            onImagePicked: (file) => selectedImage = file,
          ),
          30.ph,
          CustomButton(
            text: S.of(context).done,
            onTap: () {
              navigatePop(context);
            },
          ),
          18.ph,
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
