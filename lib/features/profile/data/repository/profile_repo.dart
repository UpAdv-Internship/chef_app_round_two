import 'package:chef_app_round_two/core/databases/api/api_consumer.dart';
import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/databases/cache/cache_helper.dart';
import 'package:chef_app_round_two/core/error/exception.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/profile/data/model/chef_data_model.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfileRepo {
  //! Get Data
  Future<Either<String, ChefModel>> getData() async {
    try {
      //
      var decodedId = JwtDecoder.decode(
          'FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZGU1ZGM4OThiMWJiZTYyYjIwMWJkNCIsImVtYWlsIjoia2hhbGVkcmFtZGFuODgwQGdtYWlsLmNvbSIsIm5hbWUiOiJraGFlZCIsImlhdCI6MTY5Nzk0OTY1NH0.HZuj9ph372etFYCGDC6rqK1ALqbPzzxLqniOCy7FOd0');
      final res = await sl<ApiConsumer>().get(
        EndPoint.getChefDataEndPoints(
          // sl<CacheHelper>().getData(key: Apikeys.id)
          decodedId['id'],
        ),
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
    required String location,
    required String brandName,
    required String minCharge,
    required String disc,
    required XFile image,
  }) async {
    try {
      final res = await sl<ApiConsumer>().patch(
        EndPoint.updateChef,
        data: {
          'name': name,
          'phone': phone,
          'location':
              '{"name":"Egypt","address":"meet halfa","coordinates":[1214451511,12541845]}',
          // 'location': location,
          'brandName': brandName,
          'minCharge': minCharge,
          'disc': disc,
          'profilePic': await sl<UpdateProfileCubit>().uploadImagetoApi(image),
        },
        isFormData: true,
      );
      return Right(res[Apikeys.message]);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
  //! Change Password
}
