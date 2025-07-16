import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_size.dart';

class AppTextStyle {
  static TextStyle regular12 = TextStyle(
    fontSize: AppSize.font(12.sp),
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular14 = TextStyle(
    fontSize: AppSize.font(14.sp),
    fontWeight: FontWeight.w400,
  );

  static TextStyle medium14 = TextStyle(
    fontSize: AppSize.font(14.sp),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium16 = TextStyle(
    fontSize: AppSize.font(16.sp),
    fontWeight: FontWeight.w500,
  );
}
