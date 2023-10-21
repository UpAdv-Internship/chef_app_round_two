

import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/databases/cache/cache_helper.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:dio/dio.dart';



class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[Apikeys.token] = sl<CacheHelper>().getData(key: Apikeys.token) != null
        ? 'FOODAPI ${sl<CacheHelper>().getData(key: Apikeys.token)}'
        : null;
    

    super.onRequest(options, handler);
  }
}
