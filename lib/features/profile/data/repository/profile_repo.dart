import 'dart:convert';

import 'package:chef_app_round_two/core/databases/api/api_consumer.dart';
import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/databases/cache/cache_helper.dart';
import 'package:chef_app_round_two/core/error/exception.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/profile/data/model/chef_data_model.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepo {
  //! Get Data
  Future<Either<String, ChefModel>> getData() async {
    try {
      //

      final res = await sl<ApiConsumer>().get(
        EndPoint.getChefDataEndPoints(
            sl<CacheHelper>().getData(key: Apikeys.id)),
      );
      return Right(ChefModel.fromjson(res[Apikeys.chef]));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  //! Update Profile
  Future<Either<String, String>> updateProfile({
    required String name,
    required String phone,
    Map<String, dynamic>? location,
    required String brandName,
    required String minCharge,
    required String disc,
    XFile? image,
  }) async {
    try {
      final res = await sl<ApiConsumer>().patch(
        EndPoint.updateChef,
        data: {
          'name': name,
          'phone': phone,
          'location':
             jsonEncode(location),
          // 'location': location,
          'brandName': brandName,
          'minCharge': minCharge,
          'disc': disc,
          'profilePic': image == null
              ? null
              : await sl<UpdateProfileCubit>().uploadImagetoApi(image),
        },
        isFormData: true,
      );
      return Right(res[Apikeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
  //! Change Password

  //! Logout
  Future<Either<String, String>> logout() async {
    try {
      final res = await sl<ApiConsumer>().get(EndPoint.logout);
      return Right(res[Apikeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
