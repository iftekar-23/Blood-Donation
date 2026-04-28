import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../splash/splash_screen.dart';

enum AppRoutes{
  splash,
  main,
  signIn,
  register,
  account,
  bloodGroupSelected,
  emailedUsers,
  notifications
}

GoRouter goRouter (GoRouterRef ret){
  return GoRouter(routes: [
    GoRoute(
        path: '/splash',
      name: AppRoutes.splash.name,
      builder: (ctx, state) => const SplashScreen()
    )
  ]);
}