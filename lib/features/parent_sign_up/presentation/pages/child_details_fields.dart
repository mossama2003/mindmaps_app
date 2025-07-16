import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_field_text.dart';
import 'image_picker_widget.dart';

class ChildDetailsFields extends StatelessWidget {
  const ChildDetailsFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'sign_up.child_main_details'.tr(),
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text(
          'sign_up.child_main_details_description'.tr(),

          style: TextStyle(fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
        ImagePickerWidget(),
        SizedBox(height: 12.h),

        CustomFieldText(
          title: "sign_up.full_name".tr(),
          controller: TextEditingController(),
          hintText: "sign_up.enter_name".tr(),
          iconStart: AppAssetsIcons.personIcon,
        ),
        SizedBox(height: 12.h),
        CustomFieldText(
          title: "sign_up.age".tr(),
          controller: TextEditingController(),
          hintText: "sign_up.enter_age".tr(),
          iconStart: AppAssetsIcons.personIcon,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
