import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:flutter/material.dart';

AppBar getSignUpAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.orange,
    title: Text(
      AppStrings.createAccount.tr(context),
      style: const TextStyle(color: AppColors.white),
    ),
    leading: IconButton(
      onPressed: () {
        popNavigate(context: context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.white,
      ),
    ),
  );
}
