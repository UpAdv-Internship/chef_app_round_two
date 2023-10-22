import 'package:chef_app_round_two/core/databases/api/api_consumer.dart';
import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/error/exception.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/sign_in/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

class LoginRepository{
    Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.chefSignIn, data: {
        Apikeys.email: email,
        Apikeys.password: password,
      });
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}