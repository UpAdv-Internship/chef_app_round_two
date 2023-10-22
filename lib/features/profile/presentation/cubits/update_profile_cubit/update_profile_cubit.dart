import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/profile/data/repository/profile_repo.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.profileRepo) : super(UpdateProfileInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController minChargeController = TextEditingController();
  TextEditingController discController = TextEditingController();
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  XFile? image;

  //! Image Picker
  void takePhoto(value) {
    image = value;
    emit(TakePhotoSuccessState());
  }

  Future<XFile?> imagePicker(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      return image;
    } else {
      return null;
    }
  }

  Future uploadImagetoApi(XFile image) async {
    return MultipartFile.fromFileSync(
      image.path,
      filename: image.path.split('/').last,
    );
  }

  final ProfileRepo profileRepo;
  //! Update Profile
  Future updateProfile() async {
    emit(UpdateProfileLoadingState());
    final res = await profileRepo.updateProfile(
      name: nameController.text,
      phone: phoneController.text,
      location: locationController.text,
      brandName: brandNameController.text,
      minCharge: minChargeController.text,
      disc: discController.text,
      image: image!,
    );
    res.fold(
      (l) => emit(UpdateProfileErrorState(l)),
      (r) {
        sl<HomeCubit>().getData();
        emit(UpdateProfileSuccessState(r));
      },
    );
  }
  //! Change Password
  //! Logout
}
