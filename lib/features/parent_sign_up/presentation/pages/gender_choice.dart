

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';

class GenderChoice extends StatelessWidget {
  const GenderChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "sign_up.add_your_child_details".tr(),
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text("sign_up.select_gender".tr(), style: TextStyle(fontSize: 14.sp)),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(AppAssetsImages.girl, width: 150.w, height: 150.h),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 120.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "sign_up.girl".tr(),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(AppAssetsImages.boy, width: 150.w, height: 150.h),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 120.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "sign_up.boy".tr(),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 75.h),
      ],
    );
  }
}
