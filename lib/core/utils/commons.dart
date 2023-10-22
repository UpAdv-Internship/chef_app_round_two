import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigate({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(
    context,
    route,
    arguments: arg,
  );
}

void navigateReplacment({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(
    context,
    route,
    arguments: arg,
  );
}
//! Toast


void showToast({required String message, required ToastStates toastStates}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    textColor: AppColors.white,
    fontSize: 20,
    timeInSecForIosWeb: 4,
    backgroundColor: getState(toastStates),
  );
}

enum ToastStates { success, error, warning }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.success:
      return AppColors.green;
    case ToastStates.warning:
      return AppColors.orange;
    case ToastStates.error:
      return AppColors.red;
  }
}
