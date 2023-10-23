import 'package:chef_app_round_two/core/Widgets/custom_text_field.dart';
import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/forget_password_cubit/cubit/forget_password_state.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/widgets/custom_button.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/widgets/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateReplacment(context: context, route: Routes.login);
        }, icon: const Icon(Icons.arrow_back)),
        title: Text(AppStrings.forgetPassword.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
               if(state is ForgetPasswordSuccessState){
                        showToast(message: AppStrings.checkMail.tr(context), toastStates:ToastStates.success);
                        BlocProvider.of<ForgetPasswordCubit>(context)
                                    .codeController.clear();
                        navigateReplacment(context: context, route: Routes.resetPasswordScreen);
                        
                    }
                    if(state is ForgetPasswordErrorState){
                        showToast(message: AppStrings.thisEmailNotValid.tr(context), toastStates: ToastStates.error);
                    }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
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
                      AppStrings.sendResetLinkInfo.tr(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //text field
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context).emailController,
                      hint: AppStrings.email.tr(context),
                      validate: (data) {
                              if ( data!.isEmpty || !data.contains('@gmail.com')) {
                                return AppStrings.pleaseEnterValidEmail
                                    .tr(context);
                              }
                    
                              return null;
                            },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //send code button
                    state is ForgetPasswordLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<ForgetPasswordCubit>(context)
                                  .sendCodeKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .sendCode();
                                    //gded
                                
                              }
                            },
                            text: AppStrings.sendResetLink.tr(context),
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
