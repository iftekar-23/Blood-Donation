import 'package:blood_donation/routes/routes.dart';
import 'package:blood_donation/util/app_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: AppStyles.mainColor),
        useMaterial3: true,
        appBarTheme: AppBarTheme().copyWith(
          color: AppStyles.mainColor,
          centerTitle: true,
          iconTheme: const IconThemeData().copyWith(
            color: Colors.white
          )
        ),
      ),

    );
  }
}

