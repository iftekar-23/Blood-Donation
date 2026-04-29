import 'package:blood_donation/features/authentication/presentation/screens/registration_screen.dart';
import 'package:blood_donation/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:blood_donation/routes/go_router_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../features/user_management/presentation/screens/main_screen.dart';
import '../splash/splash_screen.dart';

part 'routes.g.dart';

enum AppRoutes {
  splash,
  main,
  signIn,
  register,
  account,
  bloodGroupSelected,
  emailedUsers,
  notifications,
}

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (ctx, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;

      if (isLoggedIn &&
          (state.uri.toString() == '/splash' ||
              state.uri.toString() == '/register')) {
        return '/main';
      } else if (!isLoggedIn && state.uri.toString().startsWith('/main')) {
        return '/signIn';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
      GoRoute(
        path: '/splash',
        name: AppRoutes.splash.name,
        builder: (ctx, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoutes.signIn.name,
        builder: (ctx, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/register',
        name: AppRoutes.register.name,
        builder: (ctx, state) {
          final type = state.extra as String? ?? "User";
          return RegistrationScreen(type: type,);
        },
      ),
      GoRoute(
        path: '/main',
        name: AppRoutes.main.name,
        builder: (ctx, state) => const MainScreen(),
      ),
    ],
  );
}
