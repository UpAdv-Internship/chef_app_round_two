import 'package:chef_app_round_two/features/sign_in/data/model/reset_password_model.dart';
import 'package:chef_app_round_two/features/sign_in/data/reposatory/forget_password_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordRep) : super(ForgetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRep;
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void sendCode() async {
    emit(ForgetPasswordLoadingState());
    final res = await forgetPasswordRep.sendCode(emailController.text);
    res.fold((l) => emit(ForgetPasswordErrorState(l)),
        (r) => emit(ForgetPasswordSuccessState(r)));
  }

  //!reset password
  //* new password text field
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  bool isNewPasswordsShowing = true;
  IconData suffixIconNewPassword = Icons.visibility;
  void changeNewPasswordSuffixIcon() {
    isNewPasswordsShowing = !isNewPasswordsShowing;
    suffixIconNewPassword =
        isNewPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //* confirm password text field
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;
  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordsShowing = !isConfirmPasswordsShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

  // change password method that receives new password and confirm password and code
  ResetPasswordModel? resetPasswordModel;
  void resetPassword() async {
    emit(ResetPasswordLoadingState());
    final res = await forgetPasswordRep.resetPassword(
      email: emailController.text,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
      code: codeController.text,
    );
    res.fold((l) {
      
      emit(ResetPasswordErrorState(l));
    }, (r) => emit(ResetPasswordSuccessState(r)));
  }
}
