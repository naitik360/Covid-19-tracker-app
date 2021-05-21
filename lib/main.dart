import 'package:coronavirus_tracker_app_naitik_verma/Home.dart';
import 'package:coronavirus_tracker_app_naitik_verma/data_source.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primaryBlack,
    ),
    home:
        HomePage(), /*AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splash: Lottie.network('https://lottiefiles.com/17894-work-from-home'),
        nextScreen: 
        splashIconSize: 12,
        splashTransition: SplashTransition.fadeTransition,
        duration: 20000),*/
  ));
}
