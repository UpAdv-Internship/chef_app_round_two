import 'package:chef_app_round_two/features/profile/presentation/cubits/change_password_cubit/update_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/update_password_repository.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this.changePassRepo) : super(UpdatePasswordInitial());
  final UpdatePasswordRepository changePassRepo;
  GlobalKey<FormState> updatePasswordKey = GlobalKey<FormState>();

//new password
  TextEditingController newPassController = TextEditingController();

  bool isNewPasswordsShowing = true;
  IconData suffixIconNewPassword = Icons.visibility_off;
  void updateNewPasswordSuffixIcon() {
    isNewPasswordsShowing = !isNewPasswordsShowing;
    suffixIconNewPassword =
        isNewPasswordsShowing ? Icons.visibility_off : Icons.visibility;
    emit(UpdateNewPasswordSuffixIcon());
  }

  //old password
  TextEditingController oldPassController = TextEditingController();

  bool isOldPasswordsShowing = true;
  IconData suffixIconOldPassword = Icons.visibility_off;
  void updateOldPasswordSuffixIcon() {
    isOldPasswordsShowing = !isOldPasswordsShowing;
    suffixIconOldPassword =
        isOldPasswordsShowing ? Icons.visibility_off : Icons.visibility;
    emit(UpdateOldPasswordSuffixIcon());
  }

  //confirm password
  TextEditingController confirmPassController = TextEditingController();

  bool isConfirmPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility_off;
  void confirmPasswordSuffixIcon() {
    isConfirmPasswordsShowing = !isConfirmPasswordsShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordsShowing ? Icons.visibility_off : Icons.visibility;
    emit(ConfirmPasswordSuffixIcon());
  }

  void updatePassword() async {
    emit(UpdatePasswordLoadingState());
    final result = await changePassRepo.changePassword(
      oldPass: oldPassController.text,
      newPass: newPassController.text,
      confirmPassword: confirmPassController.text,
    );
    result.fold((l) => emit(UpdatePasswordErrorState(l)),
        (r) => emit(UpdatePasswordSuccessState(r)));
  }
}
