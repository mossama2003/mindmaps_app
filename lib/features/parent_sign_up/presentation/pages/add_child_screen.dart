import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/helper/app_navigator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import 'child_details_screen.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Stack(
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
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  children: [
                    SizedBox(height: 18.h),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "sign_up.add_children".tr(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssetsImages.girl,
                          width: 150.w,
                          height: 150.h,
                        ),
                        Image.asset(
                          AppAssetsImages.boy,
                          width: 150.w,
                          height: 150.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "sign_up.add_children_details".tr(),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),

                    /// Subtitle
                    Text(
                      'sign_up.press_to_add_child'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.black100,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    InkWell(
                      onTap: () {
                        AppNavigator.push(ChildDetailsScreen());
                      },
                      child: Container(
                        width: 160.w,
                        height: 120.h,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: AppColors.grey20,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 28.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "sign_up.add_child".tr(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomButton(
                      title: "sign_up.press_here".tr(),

                      width: 170.w,
                      onTap: () {
                        AppNavigator.push(ChildDetailsScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
