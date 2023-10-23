import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNameTextFormField extends StatelessWidget {
  const CustomNameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);

    return CustomSignUpTextFormField(
      controller: signupCubit.nameTextEditingController,
      lable: AppStrings.name.tr(context),
      keyboardType: TextInputType.name,
      validate: (value) {
        if (value!.isEmpty) {
          return AppStrings.thisFieldIsRequired.tr(context);
        } else if (value.length < 3) {
          return AppStrings.pleaseEnterValidName.tr(context);
        }
        return null;
      },
    );
  }
}
