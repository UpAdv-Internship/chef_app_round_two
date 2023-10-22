class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class CheckEmailSuccessState extends SignUpState {}

final class CheckEmailFailureState extends SignUpState {
  final String errMessage;

  CheckEmailFailureState({required this.errMessage});
}

final class CheckEmailLoadingState extends SignUpState {}

final class UpdateStepperIndexState extends SignUpState {}
