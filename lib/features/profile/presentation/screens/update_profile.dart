import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/profile/presentation/components/profile_text_field.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_state.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/custom_spiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.editProfile.tr(context)),
          backgroundColor: AppColors.primary,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileSuccessState) {
                    showToast(
                        message: state.message,
                        toastStates: ToastStates.success);
                    navigateReplacment(context: context, route: Routes.home);
                  }
                  if (state is UpdateProfileErrorState) {
                    showToast(
                        message: state.message, toastStates: ToastStates.error);
                  }
                },
                builder: (context, state) {
                  final updateCubit =
                      BlocProvider.of<UpdateProfileCubit>(context);
                  updateCubit.nameController.text =
                      sl<HomeCubit>().chefModel!.name;
                  updateCubit.phoneController.text =
                      sl<HomeCubit>().chefModel!.phone;
                  updateCubit.locationController.text =
                      updateCubit.currentAddress.toString();
                  updateCubit.brandNameController.text =
                      sl<HomeCubit>().chefModel!.brandName;
                  updateCubit.minChargeController.text =
                      '${sl<HomeCubit>().chefModel!.minCharge}';
                  updateCubit.discController.text =
                      sl<HomeCubit>().chefModel!.disc;
                  return Column(
                    children: [
                      //! Image Picker
                      SizedBox(
                        width: 200.w,
                        height: 200.h,
                        child: Stack(
                          children: [
                            //* Image
                            Align(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(85),
                                child: Container(
                                    padding: const EdgeInsets.all(0),
                                    width: 170,
                                    height: 170,
                                    child: sl<UpdateProfileCubit>().image ==
                                            null
                                        ? CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl: sl<HomeCubit>()
                                                .chefModel!
                                                .profilePic,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: AppColors.grey,
                                              highlightColor: AppColors.white,
                                              enabled: true,
                                              child: const CircleAvatar(
                                                radius: 85,
                                                backgroundColor: AppColors.grey,
                                              ),
                                            ),
                                          )
                                        : Image.file(
                                            File(sl<UpdateProfileCubit>()
                                                .image!
                                                .path),
                                            fit: BoxFit.fill,
                                          )),
                              ),
                            ),
                            //* Edit Button
                            Positioned(
                              bottom: 15.h,
                              right: 15.w,
                              child: InkWell(
                                child: const CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  child: Icon(
                                    Icons.edit,
                                    color: AppColors.white,
                                  ),
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      contentPadding: const EdgeInsets.all(0),
                                      content: Container(
                                        color: AppColors.primary,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading: const Icon(
                                                Icons.camera,
                                                color: AppColors.white,
                                              ),
                                              title: Text(AppStrings.camera
                                                  .tr(context)),
                                              titleTextStyle: const TextStyle(
                                                color: AppColors.white,
                                                fontSize: 20,
                                              ),
                                              visualDensity:
                                                  VisualDensity.compact,
                                              onTap: () {
                                                Navigator.pop(context);
                                                updateCubit
                                                    .imagePicker(
                                                        ImageSource.camera)
                                                    .then((value) => updateCubit
                                                        .takePhoto(value));
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(Icons.photo,
                                                  color: AppColors.white),
                                              title: Text(AppStrings.gallery
                                                  .tr(context)),
                                              titleTextStyle: const TextStyle(
                                                color: AppColors.white,
                                                fontSize: 20,
                                              ),
                                              visualDensity:
                                                  VisualDensity.compact,
                                              onTap: () {
                                                Navigator.pop(context);
                                                updateCubit
                                                    .imagePicker(
                                                        ImageSource.gallery)
                                                    .then((value) => updateCubit
                                                        .takePhoto(value));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      //! Form
                      Form(
                        key: updateCubit.updateProfileKey,
                        child: Column(
                          children: [
                            //* Name TextField
                            ProfileTextFormField(
                              controller: updateCubit.nameController,
                              label: AppStrings.name.tr(context),
                              hint: AppStrings.enterYourName.tr(context),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cannot be empty!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //* Phone TextField
                            ProfileTextFormField(
                              controller: updateCubit.phoneController,
                              label: AppStrings.phoneNumber.tr(context),
                              hint: AppStrings.enterPhoneNumber.tr(context),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.length != 11) {
                                  return AppStrings.pleaseEnterValidNumber
                                      .tr(context);
                                }
                                if (value.isEmpty) {
                                  return AppStrings.thisFieldIsRequired
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //* Location TextField
                            ProfileTextFormField(
                              controller: updateCubit.locationController,
                              label: AppStrings.location.tr(context),
                              hint: updateCubit.currentAddress ??
                                  AppStrings.location.tr(context),
                              keyboardType: TextInputType.streetAddress,
                              validator: (value) {
                                if (updateCubit.location == null) {
                                  return AppStrings.thisFieldIsRequired
                                      .tr(context);
                                } else {
                                  return null;
                                }
                              },
                              readOnly: true,
                              suffixIcon: state is GetAddressLoadingState
                                  ? const CustomSpiner()
                                  : state is GetAddressSuccessState
                                      ? const Icon(Icons.done,
                                          color: AppColors.primary)
                                      : state is GetAddressFailureState
                                          ? const Icon(
                                              Icons.error,
                                              color: AppColors.red,
                                            )
                                          : IconButton(
                                              icon: const Icon(Icons.map,
                                                  color: AppColors.primary),
                                              onPressed: () async {
                                                updateCubit.currentPosition =
                                                    await updateCubit
                                                        .getPosition();

                                                updateCubit.getAdress(
                                                    updateCubit.currentPosition!
                                                        .latitude,
                                                    updateCubit.currentPosition!
                                                        .longitude);
                                              },
                                            ),
                            ),

                            SizedBox(height: 15.h),
                            //* Brand Name TextField
                            ProfileTextFormField(
                              controller: updateCubit.brandNameController,
                              label: AppStrings.brandName.tr(context),
                              hint: AppStrings.pleaseEnterValidBrandName
                                  .tr(context),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.thisFieldIsRequired
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //* Minimun Charge TextField
                            ProfileTextFormField(
                              controller: updateCubit.minChargeController,
                              label: AppStrings.minCharge.tr(context),
                              hint: AppStrings.pleaseEnterValidMinCharge
                                  .tr(context),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.thisFieldIsRequired
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //* Discreption TextField
                            ProfileTextFormField(
                              controller: updateCubit.discController,
                              label: AppStrings.description.tr(context),
                              hint: AppStrings.pleaseEnterValidDesc.tr(context),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.length <= 20) {
                                  return AppStrings
                                      .pleaseEnterValidChargeAtLeastTwentyChar
                                      .tr(context);
                                }
                                if (value.isEmpty) {
                                  return AppStrings.thisFieldIsRequired
                                      .tr(context);
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //! Update Button
                            state is UpdateProfileLoadingState
                                ? const CircularProgressIndicator(
                                    color: AppColors.primary,
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      if (updateCubit
                                          .updateProfileKey.currentState!
                                          .validate()) {
                                        updateCubit.updateProfile();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      fixedSize:
                                          const Size(double.maxFinite, 50),
                                    ),
                                    child: Text(AppStrings.save.tr(context)),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
