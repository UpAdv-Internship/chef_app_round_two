import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_disc_text_form_filed.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/requierd_files.dart';
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: signupCubit.step4FormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),

                //!Discription
                Text(
                  AppStrings.letUsKnowYou.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 10),

                const CustomDiscriptionTextFormFiled(),
                const SizedBox(height: 50),
                //!Requierd Files
                Text(
                  AppStrings.requierdFiles.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 10),
                const CustomRequierdFiles(),
                const SizedBox(height: 50),

                //!Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          signupCubit.decreaseStepperIndex();
                        },
                        child: Text(
                          AppStrings.previous.tr(context),
                          style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          if (signupCubit.step4FormKey.currentState!
                              .validate()) {
                            if (signupCubit.frontId != null &&
                                signupCubit.backId != null &&
                                signupCubit.healthCertificate != null) {
                            } else {
                              showToast(
                                  message: AppStrings.upladPhoto.tr(context),
                                  toastStates: ToastStates.warning);
                            }
                          }
                        },
                        child: Text(
                          AppStrings.createAccount.tr(context),
                          style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
