import '../../../../core/constants/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/helper/app_navigator.dart';
import '../../../../core/style/app_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/style/app_colors.dart';
import '../../../parent/sign_in/presentation/screens/parent_sign_in_screen.dart';
import '../cards/intro_type_card.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSize.padding(vertical: 70),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: AppSize.margin(top: 130),
                width: AppSize.getWidth(350),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.blanchedAlmond,
                ),
                child: Padding(
                  padding: AppSize.padding(top: 90, horizontal: 16, bottom: 24),
                  child: Column(
                    children: [
                      Text(
                        'intro.title'.tr(),
                        style: TextStyle(
                          fontFamily: AppConstants.tajawalFont,
                          fontWeight: FontWeight.w700,
                          fontSize: AppSize.font(20),
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: AppSize.getHeight(17)),
                      Text(
                        'intro.subtitle'.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppConstants.tajawalFont,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.font(20),
                          color: AppColors.black.withValues(alpha: 0.5),
                        ),
                      ),
                      SizedBox(height: AppSize.getHeight(40)),
                      Row(
                        children: [
                          IntroCard(
                            title: 'intro.teacher'.tr(),
                            subtitle: 'intro.subtitle_teacher'.tr(),
                            onTap: () {},
                          ),
                          Spacer(),
                          IntroCard(
                            title: 'intro.parent'.tr(),
                            subtitle: 'intro.subtitle_parent'.tr(),
                            onTap: () =>
                                AppNavigator.push(ParentSignInScreen()),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.getHeight(25)),
                      IntroCard(
                        title: 'intro.student'.tr(),
                        subtitle: 'intro.subtitle_student'.tr(),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssetsImages.girl,
                    width: AppSize.getSize(166),
                    height: AppSize.getHeight(166),
                  ),
                  Image.asset(
                    AppAssetsImages.boy,
                    width: AppSize.getSize(166),
                    height: AppSize.getHeight(166),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
