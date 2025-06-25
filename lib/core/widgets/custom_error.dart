import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_svg.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, this.onRefresh});

  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRefresh,
      child: Padding(
        padding: AppSize.padding(all: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSvg(svg: AppAssetsSvg.error, height: AppSize.getHeight(225)),
            SizedBox(
              width: double.infinity,
              height: AppSize.getHeight(30),
            ),
            Text(
              'core.error'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey60,
                fontSize: AppSize.font(14),
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onRefresh != null) ...[
              SizedBox(height: AppSize.getHeight(30)),
              InkWell(
                onTap: onRefresh,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary.withValues(alpha: .2),
                  ),
                  padding: AppSize.padding(vertical: 8, horizontal: 16),
                  child: Text(
                    'core.refresh'.tr(),
                    style: TextStyle(
                      fontSize: AppSize.font(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
