import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
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