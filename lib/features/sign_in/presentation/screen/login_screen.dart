import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/cubit/login_cubit.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/cubit/login_state.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/widgets/custom_button.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/widgets/custom_login_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    AppAssets.backgroundTwo,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 92.h,
                  ),
                  Center(
                      child: Text(
                    'welcome back',
                    style: Theme.of(context).textTheme.displayLarge,
                  ))
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final loginCubit = BlocProvider.of<LoginCubit>(context);
                    return Form(
                      key: loginCubit.loginKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //!text field email
                          CustomLoginTextFormField(
                              controller: loginCubit.loginController,
                              hint: 'Email',
                              validate: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                            return "The email address you entered isn't connected to an account"
                                    ;
                              }   

                              return null;
                            },
                              
                              ),
                              
                          SizedBox(
                            height: 32.h,
                          ),
                          //!text field password
                          CustomLoginTextFormField(
                              controller: loginCubit.passwordController,
                              hint: 'Password',validate: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return "The password that you've entered is incorrect"
                                    ;
                              }

                              return null;
                            },),
                          SizedBox(
                            height: 5.h,
                          ),
                          //!forget password button
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'forget passwrd ?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: AppColors.grey,
                                            fontSize: 16),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          CustomButton(
                            onPressed: () {},
                            text: 'sign in',
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don’t have an account?',
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigate(context: context, route: Routes.signUp);
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: AppColors.primary,
                                            fontSize: 16),
                                  )),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
