import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:flutter/material.dart';

AppBar getSignUpAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.orange,
    title: const Text(
      AppStrings.createAccount,
      style: TextStyle(color: AppColors.white),
    ),
    leading: IconButton(
      onPressed: () {
        navigateReplacment(context: context, route: Routes.login);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.white,
      ),
    ),
  );
}
