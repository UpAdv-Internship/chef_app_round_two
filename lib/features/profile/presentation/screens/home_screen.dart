import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/profile/presentation/components/custom_list_tile.dart';
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
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final homeCubit = BlocProvider.of<HomeCubit>(context);
            return Column(
              children: [
                //! Profile Picture
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppAssets.backgroundTwo),
                    state is GetDataLoadingState
                        ? const CircularProgressIndicator()
                        : Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 75,
                              backgroundImage:
                                  NetworkImage(homeCubit.chefModel!.profilePic),
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 10.h),
                //! Name & Email
                state is GetDataLoadingState
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          Text(
                            homeCubit.chefModel!.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            homeCubit.chefModel!.email,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
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
                        onTap: () {},
                      ),
                      //* Logout
                      CustomListTile(
                        title: 'Logout',
                        onTap: () {},
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
