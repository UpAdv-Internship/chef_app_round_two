import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/forget_password_cubit/cubit/forget_password_state.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/widgets/custom_button.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/widgets/custom_images.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/widgets/custom_reset_password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';

import '../../../../core/widgets/custom_loading_indecator.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigateReplacment(
                  context: context, route: Routes.forgetPasswordScreen);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(AppStrings.createYourNewPassword.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccessState) {
                // show message
                showToast(
                    message: AppStrings.passwordChangedSucessfully.tr(context),
                    toastStates: ToastStates.success);
                //navigate to login screen
                navigateReplacment(context: context, route: Routes.login);
                BlocProvider.of<ForgetPasswordCubit>(context)
                    .confirmPasswordController
                    .clear();
                BlocProvider.of<ForgetPasswordCubit>(context)
                    .newPasswordController
                    .clear();
                BlocProvider.of<ForgetPasswordCubit>(context)
                    .codeController
                    .clear();
              }
              if (state is ResetPasswordErrorState) {
                showToast(
                    message: 'الكود ليس صحيحا ',
                    toastStates: ToastStates.error);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context)
                    .resetPasswordKey,
                child: Column(
                  children: [
                    ///image
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 26.h),
                      child: const CustomImages(
                        imgPath: AppAssets.lock,
                        fit: BoxFit.fill,
                      ),
                    ),

                    //text
                    Text(
                      AppStrings.createYourNewPassword.tr(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //text field => password
                    CustomResetPasswordTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .newPasswordController,
                      hint: AppStrings.newPassword.tr(context),
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isNewPasswordsShowing,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .suffixIconNewPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeNewPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //text field => confirm
                    CustomResetPasswordTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordController,
                      hint: AppStrings.confirmPassword.tr(context),
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isConfirmPasswordsShowing,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .suffixIconConfirmPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeConfirmPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        if (data !=
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .newPasswordController
                                .text) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //text field => code
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .codeController,
                      hint: AppStrings.code.tr(context),
                      validate: (data) {
                        if (num.tryParse(data!) == null) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }

                        if (data.isEmpty) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //send code button
                    state is ResetPasswordLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<ForgetPasswordCubit>(context)
                                  .resetPasswordKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .resetPassword();
                                //gded
                                // BlocProvider.of<ForgetPasswordCubit>(context)
                                //       .emailController.clear();
                                //   BlocProvider.of<LoginCubit>(context)
                                //       .passwordController.clear();
                              }
                            },
                            text: AppStrings.createYourNewPassword.tr(context),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
