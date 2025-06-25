import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_size.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, required this.value, this.onChange});

  final bool value;
  final Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.getWidth(44),
      height: AppSize.getHeight(24),
      child: Switch(
        value: value,
        onChanged: onChange,
        padding: EdgeInsets.zero,
        activeColor: AppColors.primary,
      ),
    );
  }
}
