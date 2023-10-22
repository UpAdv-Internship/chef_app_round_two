import 'package:chef_app_round_two/features/profile/presentation/screens/home_screen.dart';
import 'package:chef_app_round_two/features/profile/presentation/screens/update_profile.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/screen/login_screen.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../features/profile/presentation/screens/change_password_screen.dart';
import '../../features/splash/presentation/screens/change_lang_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String changeLang = '/changeLang';
  static const String changePassword = '/ChangePasswordScreen';

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
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.updateProfileScreen:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());

      case Routes.changeLang:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

      default:
        return null;
    }
  }
}
