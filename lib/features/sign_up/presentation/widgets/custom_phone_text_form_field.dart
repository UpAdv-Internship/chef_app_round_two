import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPhoneTextFormField extends StatelessWidget {
  const CustomPhoneTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);
    return CustomSignUpTextFormField(
      controller: signupCubit.phoneTextEditingController,
      lable: AppStrings.phoneNumber.tr(context),
      keyboardType: TextInputType.phone,
      validate: (value) {
        if (value!.isEmpty) {
          return AppStrings.thisFieldIsRequired.tr(context);
        } else if (value.length != 11) {
          return AppStrings.pleaseEnterValidNumber.tr(context);
        } else if (value.startsWith("01") == false) {
          return AppStrings.pleaseEnterValidNumber.tr(context);
        } else if (value.contains(" ") ||
            value.contains("-") ||
            value.contains("*") ||
            value.contains("#") ||
            value.contains(",") ||
            value.contains(".") ||
            value.contains("(") ||
            value.contains("/") ||
            value.contains("N") ||
            value.contains(";") ||
            value.contains(";") ||
            value.contains(")")) {
          return AppStrings.pleaseEnterValidNumber.tr(context);
        }
        return null;
      },
    );
  }
}
