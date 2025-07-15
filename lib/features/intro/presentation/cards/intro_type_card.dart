import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_size.dart';

class IntroCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const IntroCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSize.getWidth(144),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: AppColors.black.withValues(alpha: 0.4),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: AppSize.padding(all: 25),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppConstants.tajawalFont,
                  fontWeight: FontWeight.w400,
                  fontSize: AppSize.font(20),
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: AppSize.getHeight(8)),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppConstants.tajawalFont,
                  fontWeight: FontWeight.w300,
                  fontSize: AppSize.font(12),
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
