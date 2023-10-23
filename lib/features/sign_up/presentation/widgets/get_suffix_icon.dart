import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_spiner.dart';
import 'package:flutter/material.dart';

getSuffixIcon(SignUpState state) {
  if (state is CheckEmailLoadingState) {
    return const CustomSpiner();
  } else if (state is CheckEmailFailureState) {
    return const Icon(
      Icons.error,
      color: AppColors.red,
    );
  } else if (state is CheckEmailSuccessState) {
    return const Icon(Icons.done, color: AppColors.green);
  }
}
