import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpStep4 extends StatelessWidget {
  const SignUpStep4({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              const Text("Four"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        signupCubit.decreaseStepperIndex();
                      },
                      child: const Text(AppStrings.previous)),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

