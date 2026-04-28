import 'package:blood_donation/routes/routes.dart';
import 'package:blood_donation/util/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration( seconds: 2));
    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0)
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
    );

    _textController = Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0)
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
    );

    _controller.forward();

    Future.delayed( const Duration(seconds: 3), () {
      context.goNamed(AppRoutes.main.name);
    },);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.mainColor,
      body: Center(
        child: Column(
          children: [
            SlideTransition(
              position: _logoAnimation,
              child: Image.asset("assets/logo.png",
                width: 150,
              ),
            ),
            SizedBox(height: 20,),

            SlideTransition(
              position: _textController,
              child: Text("Blood donation App", style: AppStyles.titleTextStyle,)
            ),

            SlideTransition(
                position: _textController,
                child: Text("Donate & Save Live!", style: AppStyles.normalTextStyle,)
            ),
          ],
        ),
      ),
    );
  }
}
