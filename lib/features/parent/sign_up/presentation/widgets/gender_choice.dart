import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mindmaps_app/core/style/app_size.dart'; // AppSize import
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/constants/app_assets.dart';

class GenderChoice extends StatelessWidget {
  const GenderChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "sign_up.add_your_child_details".tr(),
          style: TextStyle(
            fontSize: AppSize.font(17),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSize.getHeight(10)),
        Text(
          "sign_up.select_gender".tr(),
          style: TextStyle(fontSize: AppSize.font(14)),
        ),
        SizedBox(height: AppSize.getHeight(24)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Column(
                children: [
                  Image.asset(
                    AppAssetsImages.girl,
                    width: AppSize.getWidth(166),
                    height: AppSize.getHeight(226),
                  ),
                  SizedBox(height: AppSize.getHeight(8)),
                  SizedBox(
                    width: AppSize.getWidth(120),
                    child: CustomButton(
                      title: "sign_up.girl".tr(),
                      height: AppSize.getHeight(35),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Image.asset(
                    AppAssetsImages.boy,
                    width: AppSize.getWidth(166),
                    height: AppSize.getHeight(226),
                  ),
                  SizedBox(height: AppSize.getHeight(8)),
                  SizedBox(
                    width: AppSize.getWidth(120),
                    child: CustomButton(
                      title: "sign_up.boy".tr(),

                      height: AppSize.getHeight(35),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.getHeight(75)),
      ],
    );
  }
}
