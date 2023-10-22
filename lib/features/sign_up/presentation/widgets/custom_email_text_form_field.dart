import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
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
        return CustomTextFormField(
          controller: signupCubit.emailTextEditingController,
          lable: AppStrings.email,
          onChanged: (value) {
            if (value.isNotEmpty && value.contains("@gmail.com") == false) {
              signupCubit.checkEmail();
            }
          },
          // suffixIcon: state is CheckEmailLoadingInitial
          //     ? const CircularProgressIndicator()
          //     : state is CheckEmailSuccessInitial
          //         ? const Icon(Icons.done)
          //         : state is CheckEmailFailureInitial
          //             ? const Icon(Icons.error)
          //             : null,
          validate: (value) {
            if (value!.isEmpty) {
              return "هذا الحقل مطلوب";
            } else if (value.contains("@gmail.com") == false) {
              return "not Valid Email ";
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
