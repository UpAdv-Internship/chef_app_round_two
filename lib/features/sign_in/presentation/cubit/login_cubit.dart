import 'package:chef_app_round_two/features/sign_in/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//!passsword suffixIcon
  bool isLoginPasswordsShowing = true;
  IconData suffixIcon = Icons.visibility_off ;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;
    suffixIcon =
        isLoginPasswordsShowing ?Icons.visibility_off   : Icons.visibility;
    emit(ChangeLoginPasswordSuffixIcon());
  }
}
