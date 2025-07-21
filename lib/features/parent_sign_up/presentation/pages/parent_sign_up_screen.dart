import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindmaps_app/core/constants/app_constants.dart';
import 'package:mindmaps_app/core/widgets/custom_button.dart';
import 'package:mindmaps_app/core/widgets/custom_icon.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/helper/app_navigator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_size.dart';
import '../../../../core/widgets/custom_field_text.dart';
import '../../../parent/sign_in/presentation/screens/parent_sign_in_screen.dart';

class ParentSignUpScreen extends StatelessWidget {
  const ParentSignUpScreen({super.key});

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
              child: CustomSvg(
                svg: AppAssetsSvg.signUpBackgroundShape,
                width: AppSize.getWidth(80),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomSvg(
                svg: AppAssetsSvg.signUpBackgroundShape2,
                width: AppSize.getWidth(80),
              ),
            ),

              SingleChildScrollView(
                padding: AppSize.padding(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.getHeight(5)),

                    Center(
                      child: Container(
                        width: AppSize.getSize(60),
                        height: AppSize.getSize(60),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey20,
                        ),
                        child: Padding(
                          padding: AppSize.padding(all: 16),
                          child: CustomIcon(
                            icon: AppAssetsSvg.logo,
                            withColor: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(5)),

                    /// Title
                    Text(
                      'sign_up.parent_sign_up'.tr(),
                      style: TextStyle(
                        fontSize: AppSize.font(20),
                        fontFamily: AppConstants.tajawalFont,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(6.5)),

                    /// Subtitle
                    Text(
                      'sign_up.subtitle_parent_sign_up'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppSize.font(14),
                        fontFamily: AppConstants.tajawalFont,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black100,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(24)),

                    CustomFieldText(
                      title: "sign_up.full_name".tr(),
                      controller: TextEditingController(),
                      hintText: "sign_up.enter_name".tr(),
                      iconStart: AppAssetsIcons.personIcon,
                    ),
                    SizedBox(height: AppSize.getHeight(16)),

                    CustomFieldText(
                      title: 'sign_in.phone_number'.tr(),
                      hintText: 'sign_in.enter_phone_number'.tr(),
                      controller: TextEditingController(),
                      iconStart: AppAssetsIcons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: AppSize.getHeight(16)),

                    CustomFieldText(
                      title: 'sign_in.password'.tr(),
                      hintText: 'sign_in.enter_password'.tr(),
                      controller: TextEditingController(),
                      iconStart: AppAssetsIcons.password,
                      iconEnd: AppAssetsIcons.openEye,
                    ),
                    SizedBox(height: AppSize.getHeight(47)),

                    /// Next Button
                    CustomButton(title: 'sign_up.next'.tr(), onTap: () {}),
                    SizedBox(height: AppSize.getHeight(8)),
                    Text(
                      'sign_in.or'.tr(),
                      style: TextStyle(
                        fontSize: AppSize.font(14),
                        fontFamily: AppConstants.tajawalFont,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black100,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(12)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIcon(
                          icon: AppAssetsIcons.apple,
                          withColor: true,
                          width: AppSize.getWidth(25),
                          height: AppSize.getHeight(25),
                        ),
                        SizedBox(width: AppSize.getWidth(16)),
                        CustomIcon(
                          icon: AppAssetsIcons.google,
                          withColor: true,
                          width: AppSize.getWidth(25),
                          height: AppSize.getHeight(25),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.getHeight(20)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "sign_up.already_have_account".tr(),
                          style: TextStyle(
                            fontSize: AppSize.font(14),
                            fontFamily: AppConstants.tajawalFont,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AppNavigator.replace(ParentSignInScreen());
                          },
                          child: Text(
                            "sign_up.login".tr(),
                            style: TextStyle(
                              fontFamily: AppConstants.tajawalFont,
                              fontSize: AppSize.font(14),
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
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
