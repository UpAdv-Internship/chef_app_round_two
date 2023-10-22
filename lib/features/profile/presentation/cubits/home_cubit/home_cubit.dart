import 'dart:convert';

import 'package:chef_app_round_two/features/profile/data/model/chef_data_model.dart';
import 'package:chef_app_round_two/features/profile/data/repository/profile_repo.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.profileRepo) : super(HomeInitial());

  ChefModel? chefModel;
  XFile? profileImage;

  //! Get Chef Data
  final ProfileRepo profileRepo;
  Future getData() async {
    emit(GetDataLoadingState());
    final res = await profileRepo.getData();
    res.fold(
      (l) => emit(GetDataErrorState()),
      (r) async {
        chefModel = r;
        profileImage = await downloadAndSaveImage(r.profilePic);
        emit(GetDataSuccessState());
      },
    );
  }

  Future<XFile> downloadAndSaveImage(String imageUrl) async {
    final dio = Dio();
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/image.jpg';
    return XFile(filePath);
  }
}
