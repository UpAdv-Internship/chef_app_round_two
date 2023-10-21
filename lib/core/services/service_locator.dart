import 'package:chef_app_round_two/core/databases/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


final sl = GetIt.instance;
void initServiceLocator() {
  sl.registerLazySingleton(() => CacheHelper());
  
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
