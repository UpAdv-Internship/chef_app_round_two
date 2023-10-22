import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
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
  int currentStep = 0;
  increaseStepperIndex() {
    currentStep++;
    emit(UpdateStepperIndexState());
  }

  decreaseStepperIndex() {
    currentStep--;
    emit(UpdateStepperIndexState());
  }
}
