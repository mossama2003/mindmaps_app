import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_icon.dart';

class CustomFieldText extends StatelessWidget {
  const CustomFieldText({
    super.key,
    this.title,
    this.hintText,
    this.helperText,
    this.labelText,
    required this.controller,
    this.onSubmit,
    this.padding,
    this.onTap,
    this.onChanged,
    this.iconStart,
    this.iconEnd,
    this.iconEndTap,
    this.minLines,
    this.maxLines,
    this.enabled = true,
    this.validator,
    this.iconColor = false,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.divider = false,
  });

  final TextEditingController controller;

  final bool iconColor;
  final String? iconStart;
  final String? iconEnd;
  final bool divider;
  final Function()? iconEndTap;

  final String? title;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;

  final int? minLines;
  final int? maxLines;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;

  final Function()? onTap;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: TextStyle(
              color: AppColors.black,
              fontSize: AppSize.font(16),
              fontWeight: FontWeight.w500,
              fontFamily: AppConstants.tajawalFont,
            ),
          ),
          SizedBox(height: AppSize.getHeight(8)),
        ],
        TextFormField(
          enabled: enabled,
          readOnly: readOnly,
          onTap: onTap,
          minLines: minLines ?? 1,
          maxLines: maxLines ?? minLines ?? 1,
          autofocus: autofocus,
          onChanged: onChanged,
          controller: controller,
          obscureText: obscureText,
          onFieldSubmitted: onSubmit,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
            fontSize: AppSize.font(20),
            fontWeight: FontWeight.w300,
            fontFamily: AppConstants.tajawalFont,
            
          ),
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: hintText ?? labelText ?? '',
            contentPadding: padding ?? AppSize.padding(all: 25),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.radius(12)),
              borderSide: BorderSide(color: AppColors.black.withValues(alpha: 0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.radius(12)),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.radius(12)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.radius(12)),
              borderSide: BorderSide(color: Colors.redAccent),
            ),
            prefixIconConstraints: BoxConstraints(
              minHeight: AppSize.getHeight(24),
              maxHeight: AppSize.getHeight(24),
            ),
            suffixIconConstraints: BoxConstraints(
              minHeight: AppSize.getHeight(24),
              maxHeight: AppSize.getHeight(24),
            ),
            prefixIcon: iconStart != null
                ? Padding(
                    padding: AppSize.padding(start: 10, end: 18),
                    child: CustomIcon(
                      icon: iconStart!,
                      withColor: iconColor,
                      width: AppSize.getSize(24),
                      color: iconColor ? null : AppColors.grey70,
                    ),
                  )
                : null,
            suffixIcon: iconEnd != null
                ? Padding(
                    padding: AppSize.padding(end: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (divider)
                          Container(
                            height: AppSize.getHeight(30),
                            width: 1,
                            color: AppColors.blue100,
                            margin: AppSize.margin(end: 5),
                          ),
                        CustomIcon(
                          icon: iconEnd!,
                          onTap: iconEndTap,
                          withColor: iconColor,
                          width: AppSize.getSize(40),
                          color: iconColor ? null : AppColors.grey50,
                        ),
                      ],
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
