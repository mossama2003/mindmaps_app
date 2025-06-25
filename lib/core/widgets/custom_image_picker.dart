import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/app_assets.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_svg.dart';

class CustomImagePicker extends StatelessWidget {
  final String? image;
  final String? selected;
  final Function(String) onSelect;
  final double? width;
  final double? height;

  const CustomImagePicker({
    super.key,
    required this.selected,
    required this.onSelect,
    this.image,
    this.width,
    this.height,
  });

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) onSelect(pickedImage.path);
  }

  double get _width => width ?? AppSize.getWidth(78);

  double get _height => height ?? AppSize.getHeight(74);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(context),
      child: Row(
        spacing: AppSize.getWidth(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.getSize(6)),
            child: SizedBox(
              width: _width,
              height: _height,
              child: selected != null && selected!.isNotEmpty
                  ? Image.file(
                      File(selected!),
                      width: _width,
                      height: _height,
                      fit: BoxFit.cover,
                    )
                  : image != null && image!.isNotEmpty
                      ? Image.network(
                          image!,
                          width: _width,
                          height: _height,
                          fit: BoxFit.cover,
                        )
                      : CustomSvg(
                          svg: AppAssetsSvg.uploadImage,
                          width: _width,
                          height: _height,
                        ),
            ),
          ),
          Expanded(
            child: Text(
              'core.click_to_upload'.tr(),
              style: TextStyle(
                color: AppColors.black100,
                fontSize: AppSize.font(12),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
