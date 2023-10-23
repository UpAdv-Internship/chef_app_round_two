class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileSuccessState extends UpdateProfileState {
  final String message;
  UpdateProfileSuccessState(this.message);
}

final class UpdateProfileErrorState extends UpdateProfileState {
  final String message;
  UpdateProfileErrorState(this.message);
}

final class UpdateProfileLoadingState extends UpdateProfileState {}

final class TakePhotoSuccessState extends UpdateProfileState {}

final class GetAddressSuccessState extends UpdateProfileState {}

final class GetAddressFailureState extends UpdateProfileState {
  final String errMessage;

  GetAddressFailureState({required this.errMessage});
}

final class GetAddressLoadingState extends UpdateProfileState {}
