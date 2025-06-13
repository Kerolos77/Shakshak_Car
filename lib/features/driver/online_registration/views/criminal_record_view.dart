import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/dashed_border.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

class CriminalRecordView extends StatefulWidget {
  const CriminalRecordView({super.key});

  @override
  State<CriminalRecordView> createState() => _CriminalRecordViewState();
}

class _CriminalRecordViewState extends State<CriminalRecordView> {
  XFile? _selectedImage;

  Future<void> _showImageSourceBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Please select',
                style: Styles.textStyle18Bold,
              ),
              12.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera);
                    },
                    borderRadius: BorderRadius.circular(12.r),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 28.r,
                          ),
                          Text(
                            'Camera',
                            style: Styles.textStyle16,
                          )
                        ],
                      ),
                    ),
                  ),
                  12.pw,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.gallery);
                    },
                    borderRadius: BorderRadius.circular(12.r),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          Icon(
                            Icons.photo_library,
                            color: Colors.black,
                            size: 28.r,
                          ),
                          Text(
                            'Gallery',
                            style: Styles.textStyle16,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: 'Criminal record',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From side',
            style: Styles.textStyle16Bold,
          ),
          12.ph,
          GestureDetector(
            onTap: _showImageSourceBottomSheet,
            child: _selectedImage == null
                ? DashedBorder(
                    color: AppColors.lightGreyColor,
                    strokeWidth: 2.w,
                    dashLength: 8.w,
                    dashGap: 4.w,
                    borderRadius: 12.r,
                    child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.upload_file,
                                size: 50.r,
                                color: Colors.white,
                              ),
                            ),
                            12.ph,
                            Text(
                              'Add photo',
                              style: Styles.textStyle16SemiBold,
                            )
                          ],
                        )),
                  )
                : SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          File(_selectedImage!.path),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
          ),
          30.ph,
          CustomButton(
            text: 'Done',
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
