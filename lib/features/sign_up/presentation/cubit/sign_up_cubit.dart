import 'package:chef_app_round_two/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  SignUpRepo signUpRepo;
  GlobalKey<FormState> step1FormKey = GlobalKey();
  GlobalKey<FormState> step2FormKey = GlobalKey();
  GlobalKey<FormState> step3FormKey = GlobalKey();
  GlobalKey<FormState> step4FormKey = GlobalKey();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController brandNameTextEditingController =
      TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  XFile? profilePic;
  int currentStep = 0;
  increaseStepperIndex() {
    currentStep++;
    emit(UpdateStepperIndexState());
  }

  decreaseStepperIndex() {
    currentStep--;
    emit(UpdateStepperIndexState());
  }

  checkEmail() async {
    try {
      emit(CheckEmailLoadingState());
      final result =
          await signUpRepo.checkEmail(email: emailTextEditingController.text);
      result.fold(
        (invaild) => emit(CheckEmailFailureState(errMessage: invaild)),
        (valid) => emit(CheckEmailSuccessState()),
      );
    } catch (e) {
      emit(CheckEmailFailureState(errMessage: e.toString()));
    }
  }

  void changeImage(value) {
    profilePic = value;
    emit(ChangeImageState());
  }
}
