import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/user_management/presentation/screens/main_screen.dart';
import '../splash/splash_screen.dart';

import 'routes.g.dart';

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

@riverpod
GoRouter goRouter (GoRouterRef ret){
  return GoRouter(
    initialLocation: '/splash',
      debugLogDiagnostics: true,
      routes: [
    GoRoute(
        path: '/splash',
      name: AppRoutes.splash.name,
      builder: (ctx, state) => const SplashScreen()
    ),
        GoRoute(
            path: '/main',
            name: AppRoutes.main.name,
            builder: (ctx, state) => const MainScreen()
        )

  ]);
}