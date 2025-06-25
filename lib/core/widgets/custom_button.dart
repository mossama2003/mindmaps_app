import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_icon.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    this.onTap,
    this.width,
    this.height,
    this.bgColor,
    this.textColor,
    this.iconColored,
    this.borderColor,
    required this.title,
    this.loading = false,
  });

  final String title;
  final bool loading;
  final String? icon;
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? textColor;
  final bool? iconColored;
  final Function()? onTap;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onTap,
      borderRadius: BorderRadius.circular(AppSize.getHeight(6)),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? AppSize.getHeight(52),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.getSize(6)),
          color: loading ? AppColors.grey30 : bgColor ?? AppColors.blue300,
          border: borderColor != null && !loading
              ? Border.all(color: borderColor!)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              SizedBox(
                width: AppSize.getSize(26),
                height: AppSize.getSize(26),
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.grey50,
                ),
              )
            else ...[
              if (icon != null) ...[
                CustomIcon(
                  icon: icon!,
                  withColor: iconColored ?? false,
                  color: textColor ?? AppColors.white,
                ),
                SizedBox(width: AppSize.getWidth(10)),
              ],
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: textColor ?? AppColors.white,
                    fontSize: AppSize.font(16),
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
