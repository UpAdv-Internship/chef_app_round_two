class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class CheckEmailSuccessInitial extends SignUpState {}

final class CheckEmailFailureInitial extends SignUpState {
  final String errMessage;

  CheckEmailFailureInitial({required this.errMessage});
}

final class CheckEmailLoadingInitial extends SignUpState {}

final class UpdateStepperIndexState extends SignUpState {}
