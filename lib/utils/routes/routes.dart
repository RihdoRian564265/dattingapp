// ignore_for_file: unused_local_variable

import 'package:dattingapp/authenticationScreen/getstarted_screen.dart';
import 'package:dattingapp/authenticationScreen/loading_screen.dart';
import 'package:dattingapp/utils/routes/route_name.dart';
import 'package:dattingapp/view/login/login_screen.dart';
import 'package:dattingapp/view/profile/profile_screen.dart';
import 'package:dattingapp/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.getStart:
        return MaterialPageRoute(builder: (_) => const GetstartedScreen());
      case RouteName.loading:
        return MaterialPageRoute(builder: (_) => const LoadingScreen());
      case RouteName.profil:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
