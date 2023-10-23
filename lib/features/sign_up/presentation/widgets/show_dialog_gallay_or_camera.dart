import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showDialogGallaryOrCamera(BuildContext context, SignUpCubit signupCubit) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        color: AppColors.primary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //?Camera
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: AppColors.white,
              ),
              title: const Text('Camera'),
              titleTextStyle: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
              ),
              visualDensity: VisualDensity.compact,
              onTap: () {
                ImagePicker()
                    .pickImage(source: ImageSource.camera)
                    .then((value) => signupCubit.changeProfilePicImage(value));
                Navigator.pop(context);
              },
            ),
            //?GALLARY
            ListTile(
              leading: const Icon(Icons.photo, color: AppColors.white),
              title: const Text('Gallery'),
              titleTextStyle: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
              ),
              visualDensity: VisualDensity.compact,
              onTap: () {
                ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((value) => signupCubit.changeProfilePicImage(value));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
