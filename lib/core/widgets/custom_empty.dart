import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_svg.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({
    super.key,
    this.svg,
    this.text,
    this.title,
  });

  final String? svg;
  final String? text;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.padding(all: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSvg(
            svg: svg ?? AppAssetsSvg.empty,
            height: AppSize.getHeight(260),
          ),
          SizedBox(
            width: double.infinity,
            height: AppSize.getHeight(24),
          ),
          if (title != null) ...[
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.font(16),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.getHeight(8)),
          ],
          Text(
            text ?? 'core.empty'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.grey60,
              fontSize: AppSize.font(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
