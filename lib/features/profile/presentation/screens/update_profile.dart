
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/profile/presentation/components/profile_text_field.dart';
import 'package:chef_app_round_two/features/profile/presentation/components/show_toast.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_state.dart';
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
          title: const Text('Update Profile'),
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
                                borderRadius: BorderRadius.circular(90),
                                child: SizedBox(
                                  width: 180.w,
                                  height: 180.h,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl:
                                        sl<HomeCubit>().chefModel!.profilePic,
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
                                  ),
                                ),
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
                                              title: const Text('Camera'),
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
                                              title: const Text('Gallery'),
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
                              label: 'Name',
                              hint: 'Enter Your Name',
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
                              label: 'Phone Number',
                              hint: 'Enter Your Phone Number',
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.length != 11) {
                                  return 'Lenght must be 11';
                                }
                                if (value.isEmpty) {
                                  return 'Cannot be empty!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //* Location TextField
                            ProfileTextFormField(
                              controller: updateCubit.locationController,
                              label: 'Location',
                              hint: 'Enter Your Location',
                              keyboardType: TextInputType.streetAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cannot be empty!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //* Brand Name TextField
                            ProfileTextFormField(
                              controller: updateCubit.brandNameController,
                              label: 'Brand Name',
                              hint: 'Enter Your Brand Name',
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cannot be empty!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //* Minimun Charge TextField
                            ProfileTextFormField(
                              controller: updateCubit.minChargeController,
                              label: 'Minimum Charge',
                              hint: 'Enter Minimum Charge',
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Cannot be empty!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15.h),
                            //* Discreption TextField
                            ProfileTextFormField(
                              controller: updateCubit.discController,
                              label: 'Discreption',
                              hint: 'Enter Discreption',
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.length <= 20) {
                                  return 'Lenght must be at least 20 character';
                                }
                                if (value.isEmpty) {
                                  return 'Cannot be empty!';
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
                                    child: const Text('Save'),
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
