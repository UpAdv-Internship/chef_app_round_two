import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDiscriptionTextFormFiled extends StatelessWidget {
  const CustomDiscriptionTextFormFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);
    return CustomSignUpTextFormField(
      controller: signupCubit.discTextEditingController,
      lable: AppStrings.description.tr(context),
      validate: (value) {
        if (value!.isEmpty && value.length < 20) {
          return AppStrings.pleaseEnterValidDesc.tr(context);
        }
        return null;
      },
    );
  }
}
