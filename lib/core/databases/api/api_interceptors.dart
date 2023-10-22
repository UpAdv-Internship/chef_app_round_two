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
    options.headers[Apikeys.token] = sl<CacheHelper>()
                .getData(key: Apikeys.token) !=
            null
        ? 'FOODAPI ${sl<CacheHelper>().getData(key: Apikeys.token)}'
        // : null;
        : 'FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZGU1ZGM4OThiMWJiZTYyYjIwMWJkNCIsImVtYWlsIjoia2hhbGVkcmFtZGFuODgwQGdtYWlsLmNvbSIsIm5hbWUiOiJraGFlZCIsImlhdCI6MTY5Nzk0OTY1NH0.HZuj9ph372etFYCGDC6rqK1ALqbPzzxLqniOCy7FOd0';

    super.onRequest(options, handler);
  }
}
