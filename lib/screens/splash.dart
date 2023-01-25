import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: HomeScreen(),
      splash: "assets/images/virus.png",
      splashTransition: SplashTransition.rotationTransition,
      animationDuration: Duration(seconds: 2),
      backgroundColor: Color.fromARGB(255, 49, 49, 49),
      pageTransitionType: PageTransitionType.bottomToTop,
      splashIconSize: 130.0,
      duration: 1000,
    );
  }
}
