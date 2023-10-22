import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/profile/components/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              child: Column(
                children: [
                  //! Image Picker
                  SizedBox(
                    width: 200.w,
                    height: 200.h,
                    child: Stack(
                      children: [
                        //* Image
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage(AppAssets.profile),
                        ),
                        //* Edit Button
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: const CircleAvatar(
                              backgroundColor: AppColors.primary,
                              child: Icon(
                                Icons.edit,
                                color: AppColors.white,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  //! Form
                  Form(
                    child: Column(
                      children: [
                        //* Name TextField
                        ProfileTextFormField(
                          controller: TextEditingController(),
                          label: 'Name',
                          hint: 'Enter Your Name',
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 15.h),
                        //* Phone TextField
                        ProfileTextFormField(
                          controller: TextEditingController(),
                          label: 'Phone Number',
                          hint: 'Enter Your Phone Number',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 15.h),
                        //* Location TextField
                        ProfileTextFormField(
                          controller: TextEditingController(),
                          label: 'Location',
                          hint: 'Enter Your Location',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(height: 15.h),
                        //* Brand Name TextField
                        ProfileTextFormField(
                          controller: TextEditingController(),
                          label: 'Location',
                          hint: 'Enter Your Location',
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 15.h),
                        //* Minimun Charge TextField
                        ProfileTextFormField(
                          controller: TextEditingController(),
                          label: 'Minimum Charge',
                          hint: 'Enter Minimum Charge',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 15.h),
                        //* Discreption TextField
                        ProfileTextFormField(
                          controller: TextEditingController(),
                          label: 'Discreption',
                          hint: 'Enter Discreption',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 15.h),
                        //! Update Button
                        ElevatedButton(
                          onPressed: () {
                            navigateReplacment(
                                context: context, route: Routes.home);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            fixedSize: const Size(double.maxFinite, 50),
                          ),
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
