import 'dart:async';
import 'package:flutter/material.dart';

import 'package:innovation/controllers/auth_controller.dart';
import 'package:innovation/views/screens/home_page.dart';
import 'package:innovation/views/screens/login_page.dart';
import 'package:innovation/views/screens/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.isFirstTime});

  final bool isFirstTime;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final user = Auth.fauth.currentUser;
    if (widget.isFirstTime) {
      Timer(const Duration(milliseconds: 700), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (ctx) => const OnBordingPage()));
      });
    } else if (user != null) {
      Timer(const Duration(milliseconds: 600), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const HomePage()));
      });

      // else take him to login page
    } else {
      Timer(const Duration(milliseconds: 600), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const LoginPage()));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Splash Screen",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
      )),
    );
  }
}
