import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/generated/l10n.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/router_helper.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../widgets/custom_image_picker_widget.dart';

class NationalIdView extends StatefulWidget {
  const NationalIdView({super.key});

  @override
  State<NationalIdView> createState() => _NationalIdViewState();
}

class _NationalIdViewState extends State<NationalIdView> {
  XFile? frontImage;
  XFile? backImage;
  XFile? selfieImage;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).nationalId,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(hint: S.of(context).idNumber),
            12.ph,
            CustomTextField(
              controller: _controller,
              hint: S.of(context).selectExpireDate,
              isReadOnly: true,
              suffix: Icon(
                Icons.calendar_month,
                color: AppColors.darkGreyColor,
                size: 26.r,
              ),
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  _controller.text =
                      pickedDate.toLocal().toString().split(' ')[0];
                }
              },
            ),
            20.ph,
            CustomImagePickerWidget(
              title: S.of(context).frontSide,
              onImagePicked: (file) => frontImage = file,
            ),
            20.ph,
            CustomImagePickerWidget(
              title: S.of(context).backSide,
              onImagePicked: (file) => backImage = file,
            ),
            20.ph,
            CustomImagePickerWidget(
              title: S.of(context).selfieWithId,
              onImagePicked: (file) => selfieImage = file,
            ),
            30.ph,
            CustomButton(
              text: S.of(context).done,
              onTap: () {
                if (frontImage != null &&
                    backImage != null &&
                    selfieImage != null) {
                  navigatePop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).pleaseAddAllImages),
                    ),
                  );
                }
              },
            ),
            18.ph,
          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    );
  }
}
