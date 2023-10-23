// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:up_dev_chef_app/core/utils/app_colors.dart';

// Future<XFile?> pickImage(ImageSource source) async {
//   XFile? image = await ImagePicker().pickImage(source: source);
//   if (image != null) {
//     return image;
//   } else {
//     return null;
//   }
// }

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}

// void showToast({required String messege, required ToastStates state}) {
//   Fluttertoast.showToast(
//       msg: messege,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: getState(state),
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

// enum ToastStates {
//   error,
//   success,
//   warning,
// }

// Color getState(ToastStates state) {
//   switch (state) {
//     case ToastStates.error:
//       return AppColors.red;
//     case ToastStates.success:
//       return AppColors.green;
//     case ToastStates.warning:
//       return AppColors.primary;
//   }
// }
