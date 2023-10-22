import 'package:chef_app_round_two/core/theme/app_theme.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            theme: getAppTheme(),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.signUp,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        });
  }
}
