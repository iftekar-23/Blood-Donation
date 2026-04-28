import 'package:blood_donation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF680c07)),
        useMaterial3: true,
        appBarTheme: AppBarTheme().copyWith(
          color: const Color(0xFF680c07),
          centerTitle: true,
          iconTheme: const IconThemeData().copyWith(
            color: Colors.white
          )
        ),
      ),

    );
  }
}

