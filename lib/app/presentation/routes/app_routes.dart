import 'package:flutter/cupertino.dart';

import '../modules/home/views/home_view.dart';
import '../modules/offline/offline.dart';
import '../modules/sign_in/views/sign_in.dart';
import '../modules/splash/views/splash_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes{

  return {
        Routes.splash: (context) => const SplashView(),
        Routes.signIn: (context) => const SignInView(),
        Routes.home: (context) => const HomeView(),
        Routes.offLine: (context) => const OffLine(),
      };
}