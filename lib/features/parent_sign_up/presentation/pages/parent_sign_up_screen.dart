import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindmaps_app/core/constants/app_assets.dart';
import 'package:mindmaps_app/core/style/app_colors.dart';
import 'package:mindmaps_app/core/widgets/custom_field_text.dart';

class ParentSignUpScreen extends StatelessWidget {
  const ParentSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                AppAssetsSvg.signUpBackgroundShape,
                width: 80.w,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                AppAssetsSvg.signUpBackgroundShape2,
                width: 80.w,
              ),
            ),
        
            /// Content
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
        
                  /// Logo in grey circle
                  Center(
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey20,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: SvgPicture.asset(
                          AppAssetsSvg.logo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
        
                  /// Title
                  Text(
                    'تسجيل حساب ولي الأمر',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
        
                  /// Subtitle
                  Text(
                    'أنشئ حسابك لمتابعة تقدم طفلك في حفظ القرآن',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.black100,
                    ),
                  ),
                  SizedBox(height: 24.h),
        
                  /// Name Field
                  CustomFieldText(
                    title: "الاسم بالكامل",
                    controller: TextEditingController(),
                    hintText: 'ادخل اسمك بالكامل',
                    labelText: 'الاسم بالكامل',
                    iconStart: AppAssetsIcons.personIcon,
                  ),
                  SizedBox(height: 16.h),
        
                  /// Phone Field
                  CustomFieldText(
                    title: "رقم الهاتف",
                    controller: TextEditingController(),
                    hintText: 'ادخل رقم الهاتف',
                    labelText: 'رقم الهاتف',
                    iconStart: AppAssetsIcons.phoneIcon,
                  ),
                  SizedBox(height: 16.h),
        
                  /// Password Field
                  CustomFieldText(
                    title: "كلمة المرور",
                    controller: TextEditingController(),
                    hintText: 'ادخل كلمة المرور',
                    labelText: 'كلمة المرور',
                    iconStart: AppAssetsIcons.lockIcon,
                  ),
                  SizedBox(height: 24.h),
        
                  /// Next Button
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3C963A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'التالي',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
        
                  /// OR
                  Text(
                    'او',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                  SizedBox(height: 12.h),
        
                  /// Social Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssetsSvg.google, width: 32.w),
                      SizedBox(width: 16.w),
                      SvgPicture.asset(AppAssetsSvg.apple, width: 32.w),
                    ],
                  ),
                  SizedBox(height: 24.h),
        
                  /// Bottom Text + Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لديك حساب بالفعل؟ ',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to login
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF3C963A),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
