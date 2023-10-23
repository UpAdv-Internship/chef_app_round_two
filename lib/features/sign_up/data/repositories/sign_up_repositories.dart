import 'dart:convert';

import 'package:chef_app_round_two/core/common/commons.dart';
import 'package:chef_app_round_two/core/databases/api/api_consumer.dart';
import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/error/exception.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/sign_up/data/models/check_email__model.dart';
import 'package:chef_app_round_two/features/sign_up/data/models/sign_up_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required Map<String, dynamic> location,
    required String brandName,
    required String minCharge,
    required String disc,
    required XFile healthCertificate,
    required XFile frontId,
    required XFile backId,
    required XFile profilePic,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.chefSignUp,
        isFormData: true,
        data: {
          Apikeys.name: name,
          Apikeys.phone: phone,
          Apikeys.email: email,
          Apikeys.password: password,
          Apikeys.confirmPassword: confirmPassword,
          Apikeys.location: jsonEncode(location),
          Apikeys.brandName: brandName,
          Apikeys.minCharge: minCharge,
          Apikeys.disc: disc,
          Apikeys.healthCertificate: await uploadImageToAPI(healthCertificate),
          Apikeys.frontId: await uploadImageToAPI(frontId),
          Apikeys.backId: await uploadImageToAPI(backId),
          Apikeys.profilePic: await uploadImageToAPI(profilePic),
        },
      );
      return Right(SignUpModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
