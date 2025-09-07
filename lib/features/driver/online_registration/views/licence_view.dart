import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/router_helper.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../../../../core/utils/shared_widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../presentation/view_models/driver_registration_cubit.dart';
import '../widgets/custom_image_picker_widget.dart';

class LicenceView extends StatefulWidget {
  const LicenceView({super.key});

  @override
  State<LicenceView> createState() => _LicenceViewState();
}

class _LicenceViewState extends State<LicenceView> {
  XFile? frontImage;
  XFile? backImage;
  XFile? selfieImage;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with stored data if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<DriverRegistrationCubit>();
      if (cubit.storedLicenceImage != null) {
        setState(() {
          frontImage = XFile(cubit.storedLicenceImage!.path);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverRegistrationCubit, DriverRegistrationState>(
      listener: (context, state) {
        if (state is LicenceImageStoredState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Licence images stored successfully'),
              backgroundColor: Colors.green,
            ),
          );
          navigatePop(context);
        }
      },
      builder: (context, state) {
        return BaseLayoutView(
          title: S.of(context).licence,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              initialImage: frontImage,
            ),
                20.ph,
                            CustomImagePickerWidget(
              title: S.of(context).backSide,
              onImagePicked: (file) => backImage = file,
              initialImage: backImage,
            ),
                20.ph,
                            CustomImagePickerWidget(
              title: S.of(context).selfieWithLicense,
              onImagePicked: (file) => selfieImage = file,
              initialImage: selfieImage,
            ),
                30.ph,
                CustomButton(
                  text: S.of(context).done,
                  onTap: () {
                    if (frontImage != null &&
                        backImage != null &&
                        selfieImage != null) {
                      // Store the front image as the main licence image
                      context.read<DriverRegistrationCubit>().storeLicenceImage(
                            File(frontImage!.path),
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please add all required images')),
                      );
                    }
                  },
                ),
                18.ph,
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ),
        );
      },
    );
  }
}
