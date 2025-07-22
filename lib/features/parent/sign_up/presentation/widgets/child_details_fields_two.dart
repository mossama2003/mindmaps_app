import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/style/app_size.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/widgets/custom_field_text.dart';

class ChildDetailsFieldsTwo extends StatelessWidget {
  const ChildDetailsFieldsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'sign_up.child_account_data'.tr(),
          style: TextStyle(
            fontSize: AppSize.font(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSize.getHeight(10)),
        Text(
          'sign_up.create_username_password_instruction'.tr(),
          style: TextStyle(fontSize: AppSize.font(14)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSize.getHeight(25)),
        CustomFieldText(
          title: "sign_up.child_username".tr(),
          controller: TextEditingController(),
          hintText: "sign_up.child_username_hint".tr(),
          iconStart: AppAssetsIcons.personIcon,
        ),
        SizedBox(height: AppSize.getHeight(5)),

        Align(
          alignment: Alignment.topRight,
          child: Text(
            "sign_up.username_validation_note".tr(),
            style: TextStyle(
              color: AppColors.green400,
              fontSize: AppSize.font(10),
            ),
          ),
        ),
        SizedBox(height: AppSize.getHeight(12)),
        CustomFieldText(
          title: 'sign_up.password'.tr(),
          hintText: 'sign_up.enter_password'.tr(),
          controller: TextEditingController(),
          iconStart: AppAssetsIcons.password,
          iconEnd: AppAssetsIcons.openEye,
        ),
        SizedBox(height: AppSize.getHeight(12)),
        CustomFieldText(
          title: 'sign_up.confirm_password'.tr(),
          hintText: 'sign_up.confirm_password_hint'.tr(),
          controller: TextEditingController(),
          iconStart: AppAssetsIcons.password,
          iconEnd: AppAssetsIcons.openEye,
        ),
        SizedBox(height: AppSize.getHeight(20)),
      ],
    );
  }
}
