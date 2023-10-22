import 'package:chef_app_round_two/features/profile/presentation/screens/home_screen.dart';
import 'package:chef_app_round_two/features/profile/presentation/screens/update_profile.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String intitlRoute = '/';

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
      // return MaterialPageRoute(builder: (_) =>  ());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.updateProfileScreen:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());

      default:
        return null;
    }
  }
}
