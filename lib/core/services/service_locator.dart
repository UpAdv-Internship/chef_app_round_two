import 'package:chef_app_round_two/core/databases/api/api_consumer.dart';
import 'package:chef_app_round_two/core/databases/api/dio_consumer.dart';
import 'package:chef_app_round_two/core/databases/cache/cache_helper.dart';
import 'package:chef_app_round_two/features/profile/data/repository/profile_repo.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:chef_app_round_two/features/sign_in/data/reposatory/login_repo.dart';
import 'package:chef_app_round_two/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => UpdateProfileCubit(sl()));
  sl.registerLazySingleton(() => HomeCubit(sl()));
  sl.registerLazySingleton(() => ProfileRepo());
  sl.registerLazySingleton(() => LoginRepository());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => SignUpCubit(sl()));
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => SignUpRepo());
  sl.registerLazySingleton(() => SignUpCubit(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
