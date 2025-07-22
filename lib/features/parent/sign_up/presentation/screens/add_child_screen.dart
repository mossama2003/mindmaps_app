import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/style/app_size.dart';
import '../../../../../core/widgets/background_shapes.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/helper/app_navigator.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';

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
              ...BackgroundShapes.items,

              SingleChildScrollView(
                padding: AppSize.padding(
                  horizontal: AppSize.getWidth(24),
                  vertical: AppSize.getHeight(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: AppSize.getHeight(25)),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "sign_up.add_children".tr(),
                        style: TextStyle(
                          fontSize: AppSize.font(20),
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Image.asset(
                            AppAssetsImages.girl,
                            width: AppSize.getWidth(166),
                            height: AppSize.getWidth(166),
                          ),
                        ),
                        Flexible(
                          child: Image.asset(
                            AppAssetsImages.boy,
                            width: AppSize.getWidth(166),
                            height: AppSize.getWidth(166),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.getHeight(20)),
                    Text(
                      "sign_up.add_children_details".tr(),
                      style: TextStyle(
                        fontSize: AppSize.font(20),
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(10)),

                    /// Subtitle
                    Text(
                      'sign_up.press_to_add_child'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppSize.font(14),
                        color: AppColors.black100,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(30)),

                    InkWell(
                      onTap: () {
                        AppNavigator.push(ChildDetailsScreen());
                      },
                      child: Container(
                        width: AppSize.getWidth(142),
                        height: AppSize.getHeight(110),
                        decoration: BoxDecoration(
                          color: AppColors.lightGreen,
                          borderRadius: BorderRadius.circular(
                            AppSize.getWidth(16),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: AppSize.getWidth(50),
                              height: AppSize.getWidth(50),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: AppSize.font(23),
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.getHeight(8)),
                            Text(
                              "sign_up.add_child".tr(),
                              style: TextStyle(
                                fontSize: AppSize.font(14),
                                color: AppColors.black300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(15)),
                    CustomButton(
                      title: "sign_up.press_here".tr(),
                      width: AppSize.getWidth(170),
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
