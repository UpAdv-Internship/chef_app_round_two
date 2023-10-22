import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:chef_app_round_two/features/profile/components/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //! Profile Picture
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppAssets.backgroundTwo),
                const Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage(AppAssets.profile),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            //! Name & Email
            Column(
              children: [
                Text(
                  'Khaled Ramadan',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 5.h),
                Text(
                  'khaledramdan880@gmail.com',
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
        ),
      ),
    );
  }
}
