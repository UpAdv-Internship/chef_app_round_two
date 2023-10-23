import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_spiner.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLocationFormTextFiled extends StatelessWidget {
  const CustomLocationFormTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);

    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomSignUpTextFormField(
          validate: (value) {
            if (signupCubit.location == null) {
              return AppStrings.thisFieldIsRequired.tr(context);
            } else {
              return null;
            }
          },
          readOnly: true,
          hint: signupCubit.currentAddress ?? AppStrings.location.tr(context),
          controller: signupCubit.locationTextEditingController,
          suffixIcon: state is GetAddressLoadingState
              ? const CustomSpiner()
              : state is GetAddressSuccessState
                  ? const Icon(Icons.done, color: AppColors.primary)
                  : state is GetAddressFailureState
                      ? const Icon(
                          Icons.error,
                          color: AppColors.red,
                        )
                      : IconButton(
                          icon: const Icon(Icons.map, color: AppColors.primary),
                          onPressed: () async {
                            signupCubit.currentPosition =
                                await signupCubit.getPosition();

                            signupCubit.getAdress(
                                signupCubit.currentPosition!.latitude,
                                signupCubit.currentPosition!.longitude);
                          },
                        ),
        );
      },
    );
  }
}
