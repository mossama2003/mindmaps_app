import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/style/app_size.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/custom_field_text.dart';
import 'image_picker_widget.dart';

class ChildDetailsFields extends StatelessWidget {
  const ChildDetailsFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'sign_up.child_main_details'.tr(),
          style: TextStyle(
            fontSize: AppSize.font(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSize.getHeight(10)),
        Text(
          'sign_up.child_main_details_description'.tr(),
          style: TextStyle(fontSize: AppSize.font(14)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSize.getHeight(25)),

        ImagePickerWidget(),

        SizedBox(height: AppSize.getHeight(12)),
        CustomFieldText(
          title: "sign_up.full_name".tr(),
          controller: TextEditingController(),
          hintText: "sign_up.enter_name".tr(),
          iconStart: AppAssetsIcons.personIcon,
        ),
        SizedBox(height: AppSize.getHeight(12)),
        CustomFieldText(
          title: "sign_up.age".tr(),
          controller: TextEditingController(),
          hintText: "sign_up.enter_age".tr(),
          iconStart: AppAssetsIcons.personIcon,
        ),
        SizedBox(height: AppSize.getHeight(25)),
      ],
    );
  }
}
