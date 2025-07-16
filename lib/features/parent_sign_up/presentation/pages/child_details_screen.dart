import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import 'child_details_fields.dart';
import 'child_details_fields_two.dart';
import 'gender_choice.dart';

class ChildDetailsScreen extends StatefulWidget {
  const ChildDetailsScreen({super.key});

  @override
  State<ChildDetailsScreen> createState() => _ChildDetailsScreenState();
}

class _ChildDetailsScreenState extends State<ChildDetailsScreen> {
  int currentStep = 1;

  void _nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    } else {
      // TODO: Final step logic
    }
  }

  Widget _buildStepContent() {
    switch (currentStep) {
      case 1:
        return GenderChoice();
      case 2:
        return ChildDetailsFields();
      case 3:
        return ChildDetailsFieldsTwo();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / 3;

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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 100.h),
                      LinearProgressIndicator(
                        value: progress,
                        minHeight: 5.h,
                        backgroundColor: AppColors.grey30,
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(13.r),
                      ),
                      SizedBox(height: 8.h),
                      Center(
                        child: Text(
                          "$currentStep/3",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      _buildStepContent(),

                      SizedBox(height: 20.h),
                      CustomButton(
                        title: currentStep < 3
                            ? "sign_up.next".tr()
                            : "sign_up.save".tr(),

                        onTap: () {
                          _nextStep();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
