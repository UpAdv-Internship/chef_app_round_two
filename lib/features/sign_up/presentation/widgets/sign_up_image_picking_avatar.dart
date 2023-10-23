import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_file_image.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/show_dialog_gallay_or_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpImagePickingAvatar extends StatelessWidget {
  const SignUpImagePickingAvatar({
    super.key,
    required this.signupCubit,
  });

  final SignUpCubit signupCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CustomFileImage(image: signupCubit.profilePic),
            Positioned(
              bottom: 0,
              child: InkWell(
                onTap: () {
                  showDialogGallaryOrCamera(context, signupCubit);
                },
                child: const CircleAvatar(
                  backgroundColor: AppColors.grey,
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          AppStrings.logoOrPicture.tr(context),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          AppStrings.upladPhoto.tr(context),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
