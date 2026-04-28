import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color(0xFF680c07)),
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

