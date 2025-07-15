import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mindmaps_app/core/constants/app_assets.dart';
import 'package:mindmaps_app/core/widgets/custom_button.dart';
import 'package:mindmaps_app/core/widgets/custom_icon.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/style/app_size.dart';
import '../../../../../core/widgets/custom_field_text.dart';

class ParentSignInScreen extends StatefulWidget {
  const ParentSignInScreen({super.key});

  @override
  State<ParentSignInScreen> createState() => _ParentSignInScreenState();
}

class _ParentSignInScreenState extends State<ParentSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppSize.getSize(60),
                height: AppSize.getSize(60),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
                child: Center(
                  child: CustomIcon(
                    icon: AppAssetsIcons.quran,
                    withColor: true,
                  ),
                ),
              ),
              SizedBox(height: AppSize.getHeight(16)),
              Text(
                'sign_in.parent_sign_in'.tr(),
                style: TextStyle(
                  fontFamily: AppConstants.tajawalFont,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.font(20),
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: AppSize.getHeight(4.5)),
              Text(
                'sign_in.subtitle_parent_sign_in'.tr(),
                style: TextStyle(
                  fontFamily: AppConstants.tajawalFont,
                  fontWeight: FontWeight.w500,
                  fontSize: AppSize.font(14),
                  color: AppColors.black.withValues(alpha: 0.5),
                ),
              ),
              SizedBox(height: AppSize.getHeight(45)),
              CustomFieldText(
                title: 'sign_in.phone_number'.tr(),
                hintText: 'sign_in.enter_phone_number'.tr(),
                controller: TextEditingController(),
                iconStart: AppAssetsIcons.phone,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: AppSize.getHeight(16)),

              /// Password Field
              CustomFieldText(
                title: 'sign_in.password'.tr(),
                hintText: 'sign_in.enter_password'.tr(),
                controller: TextEditingController(),
                iconStart: AppAssetsIcons.password,
                iconEnd: AppAssetsIcons.openEye,
                // iconEnd: _obscurePassword ? 'ic_eye_hide' : 'ic_eye',
                // obscureText: _obscurePassword,
                // iconEndTap: () {
                //   setState(() {
                //     _obscurePassword = !_obscurePassword;
                //   });
                // },
                // divider: true,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'sign_in.forgot_password'.tr(),
                    style: TextStyle(
                      fontFamily: AppConstants.tajawalFont,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSize.font(14),
                      color: AppColors.black.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.getHeight(8)),

              /// Next Button
              CustomButton(title: 'shared.next'.tr(), onTap: () {}),
              SizedBox(height: AppSize.getHeight(20)),

              /// OR
              Text(
                'sign_in.or'.tr(),
                style: TextStyle(
                  fontFamily: AppConstants.tajawalFont,
                  fontWeight: FontWeight.w500,
                  fontSize: AppSize.font(14),
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: AppSize.getHeight(24)),

              /// Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(
                    icon: AppAssetsIcons.apple,
                    withColor: true,
                    width: AppSize.getWidth(25),
                    height: AppSize.getHeight(25),
                  ),
                  SizedBox(width: AppSize.getWidth(20)),
                  CustomIcon(
                    icon: AppAssetsIcons.google,
                    withColor: true,
                    width: AppSize.getWidth(25),
                    height: AppSize.getHeight(25),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getHeight(15)),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    text: 'sign_in.dont_have_account'.tr(),
                    style: TextStyle(
                      fontFamily: AppConstants.tajawalFont,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSize.font(14),
                      color: AppColors.primary,
                    ),
                    children: [
                      TextSpan(
                        text: 'sign_in.create_account'.tr(),
                        style: TextStyle(
                          fontFamily: AppConstants.tajawalFont,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.font(14),
                          color: AppColors.black.withValues(alpha: 0.5),
                        ),
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
