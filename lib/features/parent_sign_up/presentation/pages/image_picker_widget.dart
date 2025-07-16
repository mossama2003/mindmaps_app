import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/style/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  void _deleteImage() {
    setState(() {
      selectedImage = null;
    });
  }

  void _viewImage() {
    if (selectedImage != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(content: Image.file(selectedImage!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "sign_up.upload_child_image".tr(),
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey80,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedImage == null
                        ? "sign_up.upload_from_device".tr()
                        : "sign_up.image_uploaded".tr(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  if (selectedImage == null)
                    Text(
                      "sign_up.image_format_note".tr(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.black100,
                      ),
                    ),
                ],
              ),
              selectedImage == null
                  ? ElevatedButton(
                      onPressed: _pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 5.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        "sign_up.select_file".tr(),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    )
                  : Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: AppColors.green400,
                            size: 24.sp,
                          ),
                          onPressed: _viewImage,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: AppColors.red300,
                            size: 24.sp,
                          ),
                          onPressed: _deleteImage,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
