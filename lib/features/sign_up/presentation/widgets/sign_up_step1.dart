import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpStep1 extends StatelessWidget {
  const SignUpStep1({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        final signupCubit = BlocProvider.of<SignUpCubit>(context);
        return Form(
          child: Column(
            children: [
              const Text("one"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        signupCubit.increaseStepperIndex();
                      },
                      child: const Text(AppStrings.next)),
                  const SizedBox(width: 20),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
