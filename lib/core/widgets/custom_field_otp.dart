import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

import '../helper/app_validators.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';

class CustomFieldOtp extends StatelessWidget {
  const CustomFieldOtp({
    super.key,
    required this.onComplete,
    required this.controller,
    required this.keyboardType,
  });

  final VoidCallback onComplete;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        length: 6,
        appContext: context,
        controller: controller,
        enablePinAutofill: true,
        pinTheme: PinTheme(
          borderWidth: 1,
          shape: PinCodeFieldShape.box,
          activeColor: AppColors.primary,
          fieldWidth: AppSize.getSize(48),
          selectedColor: AppColors.primary,
          fieldHeight: AppSize.getSize(48),
          fieldOuterPadding: EdgeInsets.zero,
          inactiveColor: AppColors.black75,
          activeFillColor: AppColors.blue300,
          inactiveFillColor: AppColors.blue50,
          selectedFillColor: AppColors.blue50,
          borderRadius: BorderRadius.circular(AppSize.getSize(12)),
        ),
        keyboardType: keyboardType,
        validator: AppValidators.otp,
        autoDisposeControllers: false,
        cursorColor: AppColors.primary,
        beforeTextPaste: (text) => true,
        onCompleted: (v) => onComplete(),
        animationType: AnimationType.fade,
        backgroundColor: Colors.transparent,
        errorTextSpace: AppSize.getHeight(30),
        autovalidateMode: AutovalidateMode.disabled,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
