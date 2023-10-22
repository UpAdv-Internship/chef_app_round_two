import 'package:chef_app_round_two/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    navigationAfterThreeSeconds();
    super.initState();
  }

  void navigationAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateReplacment(context: context, route: Routes.changeLang);
    });

    //.then((value)async {
    // await sl<CacheHelper>().getData(
    // key: ApiKey.token,
    // )==null?
    // navigate(context: context, route: Routes.changeLan):
    // navigate(context: context, route: Routes.home);
    // });
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
              AppStrings.chefApp,
              style: GoogleFonts.lato(
                  color: AppColors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
