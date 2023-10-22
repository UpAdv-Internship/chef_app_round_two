import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/sign_up_step1.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/sign_up_step2.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/sign_up_step3.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/sign_up_step4.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: StepperWidget()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: StepperBody()),
      ],
    );
  }
}

class StepperBody extends StatelessWidget {
  const StepperBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        switch (signUpCubit.currentStep) {
          case 0:
            return const SignUpStep1();
          case 1:
            return const SignUpStep2();
          case 2:
            return const SignUpStep3();
          case 3:
            return const SignUpStep4();
          default:
            return Container();
        }
      },
    );
  }
}
