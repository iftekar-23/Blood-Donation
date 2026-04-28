import 'package:blood_donation/util/app_styles.dart';
import 'package:blood_donation/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/logo.png",
          height: SizeConfig.getProportionateHeight(100),
          width: SizeConfig.getProportionateWidth(100),
          fit: BoxFit.cover,
        ),
        Text("Sign in to your account", style: AppStyles.titleTextStyle.copyWith(color: Colors.black),),
        SizedBox(height: SizeConfig.getProportionateHeight(20),),


      ],
    );
  }
}
