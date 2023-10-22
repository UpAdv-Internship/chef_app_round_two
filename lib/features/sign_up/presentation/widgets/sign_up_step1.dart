import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_brand_name_text_form_field.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_confirm_password_text_form_field.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_email_text_form_field.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_name_text_form_field.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_password_text_form_field.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_phone_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpStep1 extends StatelessWidget {
  const SignUpStep1({super.key});
  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);

    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is CheckEmailSuccessState) {
          signupCubit.increaseStepperIndex();
          showToast(
              message: AppStrings.correctData.tr(context),
              toastStates: ToastStates.success);
        } else if (state is CheckEmailFailureState) {
          showToast(
              message: AppStrings.thisEmailIsUsedBefore.tr(context),
              toastStates: ToastStates.error);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: signupCubit.step1FormKey,
            child: Column(
              children: [
                //?Body-----------------------------------------------
                //!Name
                const CustomNameTextFormField(),
                const SizedBox(height: 20),
                //!Phone
                const CustomPhoneTextFormField(),
                const SizedBox(height: 20),
                //!Brand Name
                const CustomBrandNameTextFormField(),
                const SizedBox(height: 20),
                //!Email
                const CustomEmailTextFormField(),
                const SizedBox(height: 20),

                //!Password
                const CustomPasswordTextFormField(),
                const SizedBox(height: 20),

                //!Confirm Password
                const CustomConfirmPasswordTextFormField(),
                const SizedBox(height: 40),

                //?Buttons--------------------------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (signupCubit.step1FormKey.currentState!
                              .validate()) {
                            signupCubit.checkEmail();
                          }
                        },
                        child: Text(
                          AppStrings.next.tr(context),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
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
