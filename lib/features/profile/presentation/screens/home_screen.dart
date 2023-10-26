import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app_round_two/core/Widgets/custom_loading_indecator.dart';
import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/databases/cache/cache_helper.dart';
import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/profile/presentation/components/custom_list_tile.dart';
import 'package:chef_app_round_two/features/profile/presentation/components/shimmers.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is LogoutSuccesState) {
              showToast(
                  message: state.message, toastStates: ToastStates.success);
              sl<CacheHelper>().clearData(key: Apikeys.token);
              navigateReplacment(context: context, route: Routes.login);
            }
            if (state is LogoutErrorState) {
              showToast(message: state.message, toastStates: ToastStates.error);
            }
            if (state is GetDataErrorState) {
              showToast(
                  message: AppStrings.checkYourNetwork.tr(context),
                  toastStates: ToastStates.error);
            }
          },
          builder: (context, state) {
            final homeCubit = BlocProvider.of<HomeCubit>(context);
            return state is GetDataErrorState
                //! Body if no internet
                ? Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.background),
                          fit: BoxFit.fitWidth),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.noInternetAccess.tr(context),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.white,
                                      fontSize: 30.sp,
                                    ),
                          ),
                          SizedBox(height: 20.h),
                          InkWell(
                            onTap: () {
                              homeCubit.getData();
                              navigateReplacment(
                                  context: context, route: Routes.home);
                            },
                            child: const CircleAvatar(
                              backgroundColor: AppColors.white,
                              radius: 25,
                              child: Icon(
                                Icons.refresh,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                //! Body with internet
                : Column(
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
                                      imageUrl:
                                          sl<HomeCubit>().chefModel!.profilePic,
                                      placeholder: (context, url) =>
                                          const ImageShimmer(),
                                    ),
                                  ),
                                ),
                          //! refresh icon
                          Positioned(
                            top: 20.h,
                            right: 20.w,
                            child: InkWell(
                              onTap: () {
                                homeCubit.getData();
                              },
                              child: const CircleAvatar(
                                backgroundColor: AppColors.white,
                                radius: 20,
                                child: Icon(
                                  Icons.refresh,
                                  color: AppColors.primary,
                                ),
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
                              title: AppStrings.editProfile.tr(context),
                              onTap: () {
                                if (state is GetDataSuccessState) {
                                  navigate(
                                    context: context,
                                    route: Routes.updateProfileScreen,
                                  );
                                }
                              },
                            ),
                            //* Change password
                            CustomListTile(
                              title: AppStrings.changePassword.tr(context),
                              onTap: () {
                                if (state is GetDataSuccessState) {
                                  navigate(
                                      context: context,
                                      route: Routes.changePassword);
                                }
                              },
                            ),
                            //* Settings
                            CustomListTile(
                              title: AppStrings.settings.tr(context),
                              onTap: () {
                                if (state is GetDataSuccessState) {
                                  navigate(
                                      context: context,
                                      route: Routes.settingsScreen);
                                }
                              },
                            ),
                            //* Logout
                            CustomListTile(
                              title: AppStrings.logout.tr(context),
                              onTap: () {
                                if (state is GetDataSuccessState) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(AppStrings.sureToLogout
                                              .tr(context)),
                                          SizedBox(height: 20.h),
                                          Row(
                                            children: [
                                              state is LogoutLoadingState
                                                  ? const CustomLoadingIndicator()
                                                  : ElevatedButton(
                                                      onPressed: () {
                                                        homeCubit
                                                            .logout(context);
                                                      },
                                                      child: Text(AppStrings
                                                          .logout
                                                          .tr(context)),
                                                    ),
                                              SizedBox(width: 20.w),
                                              ElevatedButton(
                                                onPressed: () {
                                                  popNavigate(context: context);
                                                },
                                                child: Text(
                                                    AppStrings.no.tr(context)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
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
