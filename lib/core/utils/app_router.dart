import 'package:chef_app_round_two/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../features/splash/presentation/screens/change_lang_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String changeLang = '/changeLang';

  static const String login = '/login';

  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String updateProfileScreen = '/updateProfileScreen';

  static const String signUpProfile = '/signUpProfile';

  static const String signUpPersonalImage = '/signUpPersonalImage';

  static const String signUpLocation = '/signUpLocation';

  static const String signUpMoreInfo = '/signUpMoreInfo';
  static const String noInternetConnection = '/noInternetConnection';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.changeLang:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return null;
    }
  }
}
