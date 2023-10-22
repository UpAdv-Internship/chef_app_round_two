import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconStepper(
      icons: const [
        Icon(Icons.person),
        Icon(Icons.camera_alt_outlined),
        Icon(Icons.flag),
        Icon(Icons.document_scanner_outlined),
      ],
      activeStepColor: AppColors.orange,
      stepReachedAnimationEffect: Curves.ease,
      enableStepTapping: false,
      lineLength: 50,
      enableNextPreviousButtons: false,
    );
  }
}
