import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
            CustomTextFormField(
              controller: signupCubit.emailTextEditingController,
              lable: AppStrings.email.tr(context),
              suffixIcon: getSuffixIcon(state),
              keyboardType: TextInputType.emailAddress,
              validate: (value) {
                if (value!.isEmpty) {
                  return AppStrings.thisFieldIsRequired.tr(context);
                } else if (value.length < 10) {
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

getSuffixIcon(SignUpState state) {
  if (state is CheckEmailLoadingState) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SpinKitFadingCircle(
            color: AppColors.primary,
            size: 30,
          ),
        ),
      ],
    );
  } else if (state is CheckEmailFailureState) {
    return const Icon(
      Icons.error,
      color: AppColors.red,
    );
  } else if (state is CheckEmailSuccessState) {
    return const Icon(Icons.done, color: AppColors.green);
  }
}
