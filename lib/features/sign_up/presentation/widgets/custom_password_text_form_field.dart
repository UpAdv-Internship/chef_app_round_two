import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPasswordTextFormField extends StatelessWidget {
  const CustomPasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);

    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomSignUpTextFormField(
          controller: signupCubit.passwordTextEditingController,
          isPassword: signupCubit.isLoginPasswordsShowing,
          suffixIcon: IconButton(
              onPressed: () {
                signupCubit.changeLoginPasswordSuffixIcon();
              },
              icon: signupCubit.passwordSuffixIcon),
          lable: AppStrings.password.tr(context),
          validate: (value) {
            if (value!.isEmpty) {
              return AppStrings.thisFieldIsRequired.tr(context);
            } else if (value.length < 6) {
              return AppStrings.pleaseEnterValidPassword.tr(context);
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
