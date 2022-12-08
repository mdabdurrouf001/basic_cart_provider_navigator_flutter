import 'dart:async';
import 'package:basic_cart_provider_navigator_flutter/screen/itemList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/replantlogo.png', //Image.asset('assets/replantlogo.png'),
      duration: 2000,
      nextScreen: ItemList(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 350,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
