import 'package:chef_app_round_two/core/databases/api/api_consumer.dart';
import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/error/exception.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/sign_in/data/model/reset_password_model.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordRepo{
Future<Either<String, String>> sendCode(String email) async {
    try {
      final responese = await sl<ApiConsumer>().post(
        EndPoint.chefSendCode,
        data: {Apikeys.email: email},
      );
      return Right(responese[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

   Future<Either<String, String>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
  }) async {
    try {
      final responese = await sl<ApiConsumer>().patch(
        EndPoint.chefForgetPassword,
        data: {
          Apikeys.email: email,
          Apikeys.password: password,
          Apikeys.confirmPassword: confirmPassword,
          Apikeys.code: code,
        },
      );
      return Right(responese[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
    catch (e){
      return Left(e.toString());
    }
  }

  
}