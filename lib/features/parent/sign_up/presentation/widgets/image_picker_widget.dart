import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/style/app_size.dart';
import '../../../../../core/style/app_colors.dart';
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
          style: TextStyle(
            fontSize: AppSize.font(15),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: AppSize.getHeight(5)),
        Container(
          width: double.infinity,
          padding:AppSize.padding(
            horizontal: AppSize.getWidth(12),
            vertical: AppSize.getHeight(5),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey80,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(AppSize.getWidth(12)),
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
                      fontSize: AppSize.font(14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(4)),
                  if (selectedImage == null)
                    Text(
                      "sign_up.image_format_note".tr(),
                      style: TextStyle(
                        fontSize: AppSize.font(12),
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
                        padding: AppSize.padding(
                          horizontal: AppSize.getWidth(20),
                          vertical: AppSize.getHeight(5),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.getWidth(8)),
                        ),
                      ),
                      child: Text(
                        "sign_up.select_file".tr(),
                        style: TextStyle(fontSize: AppSize.font(14)),
                      ),
                    )
                  : Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: AppColors.green400,
                            size: AppSize.font(24),
                          ),
                          onPressed: _viewImage,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: AppColors.red300,
                            size: AppSize.font(24),
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
