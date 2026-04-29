import 'package:blood_donation/common_widgets/common_button.dart';
import 'package:blood_donation/common_widgets/common_text_field.dart';
import 'package:blood_donation/util/app_styles.dart';
import 'package:blood_donation/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/routes.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyles.mainColor,
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            SizeConfig.getProportionateWidth(10),
            SizeConfig.getProportionateHeight(50),
            SizeConfig.getProportionateWidth(10),
            0,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: SizeConfig.getProportionateHeight(230),
                    width: SizeConfig.getProportionateWidth(100),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Sign in to your account",
                    style: AppStyles.titleTextStyle.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: SizeConfig.getProportionateHeight(20)),

                  CommonTextField(
                    hintText: "Enter Email...",
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  SizedBox(height: SizeConfig.getProportionateHeight(10)),
                  CommonTextField(
                    hintText: "Enter password",
                    textInputType: TextInputType.text,
                    controller: _passwordController,
                  ),
                  SizedBox(height: SizeConfig.getProportionateHeight(10)),

                  CommonButton(onTap: () {}, title: "Sign In", isLoading: false),
                  SizedBox(height: SizeConfig.getProportionateHeight(10)),
                  Text(
                    "OR",
                    style: AppStyles.titleTextStyle.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: SizeConfig.getProportionateHeight(10)),
                  GestureDetector(
                    onTap: () {
                      context.goNamed(
                        AppRoutes.register.name,
                        extra: "Recipient",
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text(
                        "Register as Recipient",
                        style: AppStyles.normalTextStyle.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.getProportionateHeight(10)),

                  GestureDetector(
                    onTap: () {
                      context.goNamed(AppRoutes.register.name, extra: "Donor");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text(
                        "Register as Donor",
                        style: AppStyles.normalTextStyle.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.getProportionateHeight(10)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
