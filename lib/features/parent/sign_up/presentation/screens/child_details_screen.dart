import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/style/app_size.dart';
import '../../../../../core/widgets/background_shapes.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../widgets/child_details_fields.dart';
import '../widgets/child_details_fields_two.dart';
import '../widgets/gender_choice.dart';

class ChildDetailsScreen extends StatefulWidget {
  const ChildDetailsScreen({super.key});

  @override
  State<ChildDetailsScreen> createState() => _ChildDetailsScreenState();
}

class _ChildDetailsScreenState extends State<ChildDetailsScreen> {
  int currentStep = 1;

  void _nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    } else {
      // TODO: Final step logic
    }
  }

  //  The screen body is changed with each subsequent step.

  Widget _buildStepContent() {
    switch (currentStep) {
      case 1:
        return const GenderChoice();
      case 2:
        return const ChildDetailsFields();
      case 3:
        return const ChildDetailsFieldsTwo();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / 3;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              ...BackgroundShapes.items,

              SingleChildScrollView(
                child: Padding(
                padding:   AppSize.padding(
                    horizontal: AppSize.getWidth(24),
                    vertical: AppSize.getHeight(16),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: AppSize.getHeight(100)),
                      LinearProgressIndicator(
                        value: progress,
                        minHeight: AppSize.getHeight(5),
                        backgroundColor: AppColors.grey30,
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          AppSize.getWidth(13),
                        ),
                      ),
                      SizedBox(height: AppSize.getHeight(8)),
                      Center(
                        child: Text(
                          "$currentStep/3",
                          style: TextStyle(
                            fontSize: AppSize.font(14),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.getHeight(24)),
                      _buildStepContent(),

                      SizedBox(height: AppSize.getHeight(20)),
                      CustomButton(
                        title: currentStep < 3
                            ? "sign_up.next".tr()
                            : "sign_up.save".tr(),
                        onTap: _nextStep,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
