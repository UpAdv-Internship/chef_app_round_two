import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBrandNameTextFormField extends StatelessWidget {
  const CustomBrandNameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);

    return CustomTextFormField(
      controller: signupCubit.brandNameTextEditingController,
      lable: AppStrings.brandName,
      onChanged: (value){},
      validate: (value) {
        if (value!.isEmpty) {
          return "هذا الحقل مطلوب";
        } else {
          return null;
        }
      },
    );
  }
}
