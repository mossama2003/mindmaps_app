import 'package:flutter/material.dart';

import '../../style/app_size.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        vertical: AppSize.getHeight(20),
        horizontal: AppSize.getWidth(16),
      ),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: AppSize.padding(horizontal: 20, vertical: 32),
          child: Column(mainAxisSize: MainAxisSize.min, children: children),
        ),
      ),
    );
  }
}
