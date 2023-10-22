import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/theme/app_theme.dart';
import 'package:chef_app_round_two/core/utils/app_router.dart';
import 'package:chef_app_round_two/features/splash/presentation/cubit/global_cubit.dart';
import 'package:chef_app_round_two/features/splash/presentation/cubit/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/profile/presentation/screens/change_password_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalizations.delegate
              ],
              supportedLocales: const [
                Locale('ar', "EG"),
                Locale('en', "US"),
              ],
              locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
              theme: getAppTheme(),
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.intitlRoute,
              onGenerateRoute: AppRoutes.generateRoute,

            );
          },
        );
      },
    );
  }
}
