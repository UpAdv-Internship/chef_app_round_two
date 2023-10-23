import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_location_text_form_field.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpStep3 extends StatelessWidget {
  const SignUpStep3({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: signupCubit.step3FormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //!Location
                Text(
                  AppStrings.enterYourCurrentLocation.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 10),
                const CustomLocationFormTextFiled(),
                const SizedBox(height: 50),

                //!MinCharge
                Text(
                  AppStrings.plaeseEnterYourMinCharge.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 10),
                const CustomMinChargeTextFormFiled(),
                const SizedBox(height: 100),

                //!Butttons
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (signupCubit.step3FormKey.currentState!.validate()) {
                          signupCubit.increaseStepperIndex();
                        }
                      },
                      child: Text(
                        AppStrings.next.tr(context),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomMinChargeTextFormFiled extends StatelessWidget {
  const CustomMinChargeTextFormFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);
    return CustomSignUpTextFormField(
      controller: signupCubit.minChargeTextEditingController,
      hint: AppStrings.minCharge.tr(context),
      keyboardType: TextInputType.number,
      validate: (value) {
        if (value!.isEmpty) {
          return AppStrings.thisFieldIsRequired.tr(context);
        } else if (int.parse(value) < 20) {
          return AppStrings.pleaseEnterValidMinCharge.tr(context);
        }
        return null;
      },
    );
  }
}
