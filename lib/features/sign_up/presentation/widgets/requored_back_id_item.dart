
import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RequierdBackIDFileItem extends StatelessWidget {
  const RequierdBackIDFileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.backId.tr(context),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
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
                                    .then((value) => signupCubit
                                        .changebackIdPicImage(value));
                                Navigator.pop(context);
                              },
                            ),
                            //?GALLARY
                            ListTile(
                              leading: const Icon(Icons.photo,
                                  color: AppColors.white),
                              title: const Text('Gallery'),
                              titleTextStyle: const TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                              ),
                              visualDensity: VisualDensity.compact,
                              onTap: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) => signupCubit
                                        .changebackIdPicImage(value));
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                signupCubit.healthCertificate != null
                    ? Icons.done
                    : Icons.camera,
                color: AppColors.primary,
              ),
            )
          ],
        );
      },
    );
  }
}
