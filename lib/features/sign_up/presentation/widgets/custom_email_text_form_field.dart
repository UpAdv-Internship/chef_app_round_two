import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/get_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);

    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSignUpTextFormField(
              controller: signupCubit.emailTextEditingController,
              lable: AppStrings.email.tr(context),
              suffixIcon: getSuffixIcon(state),
              keyboardType: TextInputType.emailAddress,
              validate: (value) {
                if (value!.isEmpty) {
                  return AppStrings.thisFieldIsRequired.tr(context);
                } else if (value.length < 10) {
                  return AppStrings.pleaseEnterValidEmail.tr(context);
                } else if (value.contains(" ")) {
                  return AppStrings.pleaseEnterValidEmail.tr(context);
                } else if (value.contains("@") == false) {
                  return AppStrings.pleaseEnterValidEmail.tr(context);
                } else if (value.contains(".com") == false) {
                  return AppStrings.pleaseEnterValidEmail.tr(context);
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
