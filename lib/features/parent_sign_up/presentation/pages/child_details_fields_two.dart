import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/custom_field_text.dart';

class ChildDetailsFieldsTwo extends StatelessWidget {
  const ChildDetailsFieldsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'sign_up.child_account_data'.tr(),
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text(
          'sign_up.create_username_password_instruction'.tr(),
          style: TextStyle(fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
        CustomFieldText(
          title: "sign_up.child_username".tr(),
          controller: TextEditingController(),
          hintText: "sign_up.child_username_hint".tr(),
          iconStart: AppAssetsIcons.personIcon,
        ),
        Text(
          "sign_up.username_validation_note".tr(),
          style: TextStyle(color: AppColors.green400, fontSize: 11.sp),
        ),
        SizedBox(height: 12.h),
        CustomFieldText(
          title: 'sign_up.password'.tr(),
          hintText: 'sign_up.enter_password'.tr(),
          controller: TextEditingController(),
          iconStart: AppAssetsIcons.password,
          iconEnd: AppAssetsIcons.openEye,
        ),
        SizedBox(height: 12.h),
        CustomFieldText(
          title: 'sign_up.confirm_password'.tr(),
          hintText: 'sign_up.confirm_password_hint'.tr(),
          controller: TextEditingController(),
          iconStart: AppAssetsIcons.password,
          iconEnd: AppAssetsIcons.openEye,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
