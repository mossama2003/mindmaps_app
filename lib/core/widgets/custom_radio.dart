import 'package:flutter/material.dart';

import '../style/app_size.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.title,
    required this.value,
    required this.onChange,
    required this.groupValue,
  });

  final T value;
  final String title;
  final T? groupValue;
  final Function(T?) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppSize.getSize(24),
          height: AppSize.getSize(24),
          child: Radio<T>(
            value: value,
            onChanged: onChange,
            groupValue: groupValue,
          ),
        ),
        SizedBox(width: AppSize.getSize(12)),
        Expanded(
          child: InkWell(
            onTap: () => onChange(value),
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppSize.font(15),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
