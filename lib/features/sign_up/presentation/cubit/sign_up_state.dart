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

final class ChangeProfilePicImageState extends SignUpState {}

final class ChangeFrontIdPicImageState extends SignUpState {}

final class ChangeBackIdPicImageState extends SignUpState {}

final class ChangeHealthCertificatePicImageState extends SignUpState {}

final class UpdateStepperIndexState extends SignUpState {}

final class ChangeSignUpPasswordSuffixIcon extends SignUpState {}

final class ChangeSignUpconfirmPasswordSuffixIcon extends SignUpState {}

final class SignUpLoadinStateState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpFailureState extends SignUpState {
  final String errMessage;
  SignUpFailureState({required this.errMessage});
}
