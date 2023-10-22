import 'package:chef_app_round_two/core/databases/api/api_consumer.dart';
import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/error/exception.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/sign_up/data/models/check_email__model.dart';
import 'package:dartz/dartz.dart';

class SignUpRepo {
  Future<Either<String, CheckEmailModel>> checkEmail(
      {required String email}) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.checkEmail,
        data: {
          Apikeys.email: email,
        },
      );
      return Right(CheckEmailModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
