class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class CheckEmailSuccessState extends SignUpState {}

final class CheckEmailFailureState extends SignUpState {
  final String errMessage;

  CheckEmailFailureState({required this.errMessage});
}

final class CheckEmailLoadingState extends SignUpState {}

final class GetAddressSuccessState extends SignUpState {}

final class GetAddressFailureState extends SignUpState {
  final String errMessage;

  GetAddressFailureState({required this.errMessage});
}

final class GetAddressLoadingState extends SignUpState {}

final class ChangeImageState extends SignUpState {}

final class UpdateStepperIndexState extends SignUpState {}
final class ChangeSignUpPasswordSuffixIcon extends SignUpState {}
final class ChangeSignUpconfirmPasswordSuffixIcon extends SignUpState {}



