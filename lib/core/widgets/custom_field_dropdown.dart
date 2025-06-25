import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_size.dart';

class CustomFieldDropdown<T> extends StatelessWidget {
  const CustomFieldDropdown({
    super.key,
    this.title,
    this.hintText,
    this.validator,
    this.enabled = true,
    required this.items,
    required this.selected,
    required this.onChanged,
  });

  final T? selected;
  final bool enabled;
  final String? title;
  final String? hintText;
  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>>? items;
  final FormFieldValidator<T>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: TextStyle(
              color: AppColors.grey70,
              fontSize: AppSize.font(14),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: AppSize.getHeight(8)),
        ],
        DropdownButtonFormField<T>(
          items: items,
          value: selected,
          validator: validator,
          style: TextStyle(
            color: AppColors.black,
            fontSize: AppSize.font(14),
            fontWeight: FontWeight.w600,
          ),
          isDense: true,
          isExpanded: true,
          onChanged: enabled ? onChanged : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            enabled: enabled,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.black75,
              fontSize: AppSize.font(14),
              fontWeight: FontWeight.w500,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSize.getSize(20),
              horizontal: AppSize.getSize(16),
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            size: AppSize.getSize(24),
            color: AppColors.grey50,
          ),
        ),
      ],
    );
  }
}
