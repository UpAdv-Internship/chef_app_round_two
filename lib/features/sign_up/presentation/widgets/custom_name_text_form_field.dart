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

    return CustomTextFormField(
      controller: signupCubit.nameTextEditingController,
      lable: AppStrings.name,
      keyboardType: TextInputType.name,
      validate: (value) {
        final RegExp regex = RegExp('[a-zA-Z]');
        if (value!.isEmpty) {
          return "هذا الحقل مطلوب";
        } else if (value.length < 5) {
          return "برجاء ادخال الاسم كاملا";
        } else if (regex.hasMatch(value) == false) {
          return "يجب ان يتكون الاسم من حروف فقط";
        }
        return null;
      },
    );
  }
}
