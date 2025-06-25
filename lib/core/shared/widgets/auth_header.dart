import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';
import '../../style/app_colors.dart';
import '../../style/app_size.dart';
import '../../widgets/custom_svg.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional.center,
          child: CustomSvg(
            svg: AppAssetsSvg.logo,
            width: AppSize.getWidth(90),
            height: AppSize.getHeight(84),
          ),
        ),
        SizedBox(height: AppSize.getHeight(72)),
        Text(
          title,
          style: TextStyle(
            fontSize: AppSize.font(32),
            height: AppSize.fontHeight(32, 40),
            fontWeight: FontWeight.w700,
            color: AppColors.blue300,
          ),
        ),
        SizedBox(height: AppSize.getHeight(12)),
        Text(
          desc,
          style: TextStyle(
            fontSize: AppSize.font(16),
            height: AppSize.fontHeight(16, 20),
            fontWeight: FontWeight.w500,
            color: AppColors.blue200,
          ),
        ),
      ],
    );
  }
}
