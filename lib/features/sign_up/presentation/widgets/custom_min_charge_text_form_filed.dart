import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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