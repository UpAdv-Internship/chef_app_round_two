import 'dart:io';
import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage({super.key, this.image});
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            radius: 100,
            backgroundImage: FileImage(
              File(image!.path),
            ),
          )
        : CircleAvatar(
            radius: 100,
            backgroundColor: AppColors.orange.withOpacity(0.15),
            child: Image.asset(
              AppAssets.lock,
              width: 150,
            ),
          );
  }
}
