class HomeState {}

final class HomeInitial extends HomeState {}

final class GetDataLoadingState extends HomeState {}

final class GetDataSuccessState extends HomeState {}

final class GetDataErrorState extends HomeState {}

final class LogoutLoadingState extends HomeState {}

final class LogoutSuccesState extends HomeState {
  final String message;

  LogoutSuccesState({required this.message});
}

final class LogoutErrorState extends HomeState {
  final String message;

  LogoutErrorState({required this.message});
}
