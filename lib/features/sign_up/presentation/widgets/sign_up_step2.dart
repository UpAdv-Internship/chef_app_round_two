import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/sign_up_image_picking_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpStep2 extends StatelessWidget {
  const SignUpStep2({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              //! Picture picking
              SignUpImagePickingAvatar(signupCubit: signupCubit),
              const SizedBox(height: 120),
              //!Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      signupCubit.decreaseStepperIndex();
                    },
                    child: Text(
                      AppStrings.previous.tr(context),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (signupCubit.profilePic != null) {
                        signupCubit.increaseStepperIndex();
                      } else {
                        showToast(
                            message: AppStrings.upladPhoto.tr(context),
                            toastStates: ToastStates.warning);
                      }
                    },
                    child: Text(
                      AppStrings.next.tr(context),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
