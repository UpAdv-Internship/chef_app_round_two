import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:flutter/material.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigationAfterThreeSeconds(context);
    super.initState();
  }

  void navigationAfterThreeSeconds(context) {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await sl<CacheHelper>().getData(key: Apikeys.token) == null
          ? sl<CacheHelper>().sharedPreferences.getString("cachedCode") == null
              ? navigateReplacment(context: context, route: Routes.changeLang)
              : navigateReplacment(context: context, route: Routes.login)
          : navigateReplacment(context: context, route: Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.appLogo,
              width: 140,
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.chefApp.tr(context),
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}
