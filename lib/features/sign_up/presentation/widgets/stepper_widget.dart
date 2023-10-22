import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);

    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return IconStepper(
          icons: const [
            Icon(Icons.person),
            Icon(Icons.camera_alt_outlined),
            Icon(Icons.flag),
            Icon(Icons.document_scanner_outlined),
          ],
          activeStepColor: AppColors.orange,
          stepReachedAnimationEffect: Curves.fastEaseInToSlowEaseOut,
          enableStepTapping: false,
          lineLength: 50,
          enableNextPreviousButtons: false,
          activeStep: signupCubit.currentStep,
        );
      },
    );
  }
}
