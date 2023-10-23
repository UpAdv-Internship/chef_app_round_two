import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Widgets/custom_loading_indecator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../components/ali_text_field.dart';
import '../cubits/change_password_cubit/update_password_cubit.dart';
import '../cubits/change_password_cubit/update_password_state.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
//final TextEditingController oldPassword = TextEditingController();
//final TextEditingController newPassword = TextEditingController();
//final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.changePassword.tr(context)),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                  listener: (context, state) {
                if (state is UpdatePasswordSuccessState) {
                  showToast(
                      message: state.message, toastStates: ToastStates.success);
                  navigateReplacment(context: context, route: Routes.home);
                }
                if (state is UpdatePasswordErrorState) {
                  showToast(
                      message: AppStrings.pleaseCheckYourPassword.tr(context),
                      toastStates: ToastStates.error);
                }
              }, builder: (context, state) {
                return Form(
                  key: BlocProvider.of<UpdatePasswordCubit>(context)
                      .updatePasswordKey,
                  child: Column(
                    children: [
                      //! Image
                      Image.asset(AppAssets.lock, height: 250.h),
                      const SizedBox(
                        height: 25,
                      ),
                      //! Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.changePassword.tr(context),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //! Old Password
                      AliTextFormField(
                        controller:
                            BlocProvider.of<UpdatePasswordCubit>(context)
                                .oldPassController,
                        icon: BlocProvider.of<UpdatePasswordCubit>(context)
                            .suffixIconOldPassword,
                        suffixIconOnPressed: () {
                          BlocProvider.of<UpdatePasswordCubit>(context)
                              .updateOldPasswordSuffixIcon();
                        },
                        isPassword:
                            BlocProvider.of<UpdatePasswordCubit>(context)
                                .isOldPasswordsShowing,
                        hint: AppStrings.oldPassword.tr(context),
                        validate: (data) {
                          if (data!.length < 6 || data.isEmpty) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //! New Password
                      AliTextFormField(
                        controller:
                            BlocProvider.of<UpdatePasswordCubit>(context)
                                .newPassController,
                        icon: BlocProvider.of<UpdatePasswordCubit>(context)
                            .suffixIconNewPassword,
                        isPassword:
                            BlocProvider.of<UpdatePasswordCubit>(context)
                                .isNewPasswordsShowing,
                        suffixIconOnPressed: () {
                          BlocProvider.of<UpdatePasswordCubit>(context)
                              .updateNewPasswordSuffixIcon();
                        },
                        hint: AppStrings.newPassword.tr(context),
                        validate: (data) {
                          if (data!.length < 6 || data.isEmpty) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }
                          if (data !=
                              BlocProvider.of<UpdatePasswordCubit>(context)
                                  .newPassController
                                  .text) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //! Confirm Password
                      AliTextFormField(
                        controller:
                            BlocProvider.of<UpdatePasswordCubit>(context)
                                .confirmPassController,
                        icon: BlocProvider.of<UpdatePasswordCubit>(context)
                            .suffixIconConfirmPassword,
                        isPassword:
                            BlocProvider.of<UpdatePasswordCubit>(context)
                                .isConfirmPasswordsShowing,
                        suffixIconOnPressed: () {
                          BlocProvider.of<UpdatePasswordCubit>(context)
                              .confirmPasswordSuffixIcon();
                        },
                        hint: AppStrings.confirmPassword.tr(context),
                        validate: (data) {
                          if (data!.length < 6 || data.isEmpty) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }
                          if (data !=
                              BlocProvider.of<UpdatePasswordCubit>(context)
                                  .newPassController
                                  .text) {
                            return AppStrings.pleaseEnterValidPassword
                                .tr(context);
                          }
                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 24,
                      ),
                      state is UpdatePasswordLoadingState
                          ? const CustomLoadingIndicator()
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (BlocProvider.of<UpdatePasswordCubit>(
                                          context)
                                      .updatePasswordKey
                                      .currentState!
                                      .validate()) {
                                    BlocProvider.of<UpdatePasswordCubit>(
                                            context)
                                        .updatePassword();
                                  }
                                },
                                child: Text(AppStrings.createYourNewPassword
                                    .tr(context)),
                              ),
                            ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
