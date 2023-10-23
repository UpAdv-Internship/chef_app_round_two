import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  SignUpRepo signUpRepo;
  GlobalKey<FormState> step1FormKey = GlobalKey();
  GlobalKey<FormState> step2FormKey = GlobalKey();
  GlobalKey<FormState> step3FormKey = GlobalKey();
  GlobalKey<FormState> step4FormKey = GlobalKey();
//?----------------------------------------------------------------------
  //!Name
  TextEditingController nameTextEditingController = TextEditingController();
  //!Phone
  TextEditingController phoneTextEditingController = TextEditingController();
  //!Email
  TextEditingController emailTextEditingController = TextEditingController();
  //!Password
  TextEditingController passwordTextEditingController = TextEditingController();
  //!Confirm Password
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  //!Location
  TextEditingController locationTextEditingController = TextEditingController();
  Map? location;
  //!Brand Name
  TextEditingController brandNameTextEditingController =
      TextEditingController();
  //!minCharge
  TextEditingController minChargeTextEditingController =
      TextEditingController();
  //!disc
  TextEditingController discTextEditingController = TextEditingController();

  //!frontId
  XFile? frontId;
  //!backId
  XFile? backId;

  //!healthCertificate
  XFile? healthCertificate;

  //!Profile Pic
  XFile? profilePic;
//?------------------------------------------------------------
  int currentStep = 0;
  Position? currentPosition;
  String? currentAddress;
  increaseStepperIndex() {
    currentStep++;
    emit(UpdateStepperIndexState());
  }

  decreaseStepperIndex() {
    currentStep--;
    emit(UpdateStepperIndexState());
  }

  checkEmail() async {
    try {
      emit(CheckEmailLoadingState());
      final result =
          await signUpRepo.checkEmail(email: emailTextEditingController.text);
      result.fold(
        (invaild) => emit(CheckEmailFailureState(errMessage: invaild)),
        (valid) => emit(CheckEmailSuccessState()),
      );
    } catch (e) {
      emit(CheckEmailFailureState(errMessage: e.toString()));
    }
  }

  void changeProfilePicImage(value) {
    profilePic = value;
    emit(ChangeProfilePicImageState());
  }

  void changefrontIdPicImage(value) {
    frontId = value;
    emit(ChangeFrontIdPicImageState());
  }

  void changebackIdPicImage(value) {
    backId = value;
    emit(ChangeBackIdPicImageState());
  }

  void changehealthCertificatePicImage(value) {
    healthCertificate = value;
    emit(ChangeHealthCertificatePicImageState());
  }

  Future<Position> getPosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location not available !');
      }
    } else {
      if (kDebugMode) {
        print('Location not available !');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void getAdress(latitude, longitude) async {
    try {
      emit(GetAddressLoadingState());
      List<Placemark> placemark = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemark[0];

      currentAddress = '${place.country},${place.locality},${place.street},';

      location = {
        "name": place.country ?? "Unknown",
        "address": place.locality ?? "Unknown",
        "coordinates": [latitude, longitude]
      };
      emit(GetAddressSuccessState());
    } catch (e) {
      if (kDebugMode) {
        emit(GetAddressFailureState(errMessage: e.toString()));
        print(e);
      }
    }
  }

  //!passsword suffixIcon
  bool isLoginPasswordsShowing = true;
  bool isLoginComfirmPasswordsShowing = true;

  Widget passwordSuffixIcon = const Icon(
    Icons.visibility_off,
    color: AppColors.primary,
  );
  Widget confirmPasswordSuffixIcon = const Icon(
    Icons.visibility_off,
    color: AppColors.primary,
  );
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;
    passwordSuffixIcon = isLoginPasswordsShowing
        ? const Icon(
            Icons.visibility_off,
            color: AppColors.primary,
          )
        : const Icon(
            Icons.visibility,
            color: AppColors.primary,
          );
    emit(ChangeSignUpPasswordSuffixIcon());
  }

  void changeLoginConfirmPasswordSuffixIcon() {
    isLoginComfirmPasswordsShowing = !isLoginComfirmPasswordsShowing;
    confirmPasswordSuffixIcon = isLoginComfirmPasswordsShowing
        ? const Icon(
            Icons.visibility_off,
            color: AppColors.primary,
          )
        : const Icon(
            Icons.visibility,
            color: AppColors.primary,
          );
    emit(ChangeSignUpconfirmPasswordSuffixIcon());
  }
}
