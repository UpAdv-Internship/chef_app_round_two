import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app_round_two/core/Widgets/custom_loading_indecator.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/profile/presentation/components/custom_list_tile.dart';
import 'package:chef_app_round_two/features/profile/presentation/components/shimmers.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is LogoutSuccesState) {
              navigateReplacment(context: context, route: Routes.login);
              showToast(
                  message: state.message, toastStates: ToastStates.success);
            }
            if (state is LogoutErrorState) {
              showToast(message: state.message, toastStates: ToastStates.error);
            }
          },
          builder: (context, state) {
            final homeCubit = BlocProvider.of<HomeCubit>(context);
            return Column(
              children: [
                //! Profile Picture
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Image.asset(
                        AppAssets.backgroundTwo,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    state is GetDataLoadingState
                        ? const ImageShimmer()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: SizedBox(
                              width: 180,
                              height: 180,                              
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: sl<HomeCubit>().chefModel!.profilePic,
                                placeholder: (context, url) =>
                                    const ImageShimmer(),
                              ),
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 15.h),
                //! Name & Email
                Column(
                  children: [
                    state is GetDataLoadingState
                        ? const TextShimmer()
                        : Text(
                            homeCubit.chefModel!.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                    SizedBox(height: 5.h),
                    state is GetDataLoadingState
                        ? const TextShimmer(width: 150)
                        : Text(
                            homeCubit.chefModel!.email,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                  ],
                ),
                SizedBox(height: 25.h),

                //! List Tiles
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      //* Update profile
                      CustomListTile(
                        title: 'Update Profile',
                        onTap: () {
                          navigate(
                            context: context,
                            route: Routes.updateProfileScreen,
                          );
                        },
                      ),
                      //* Change password
                      CustomListTile(
                        title: 'Change Password',
                        onTap: () {
                          navigate(
                              context: context, route: Routes.changePassword);
                        },
                      ),
                      //* Logout
                      CustomListTile(
                        title: 'Logout',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Are You Sure You Want to Logout'),
                                  SizedBox(height: 20.h),
                                  state is LogoutLoadingState
                                      ? const CustomLoadingIndicator()
                                      : Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                homeCubit.logout();
                                              },
                                              child: const Text('Logout'),
                                            ),
                                            SizedBox(width: 20.w),
                                            ElevatedButton(
                                              onPressed: () {
                                                popNavigate(context: context);
                                              },
                                              child: const Text('no'),
                                            ),
                                          ],
                                        )
                                      
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
