import 'dart:async';
import 'package:flutter/material.dart';

import 'package:innovation/controllers/auth_controller.dart';
import 'package:innovation/views/home_page.dart';
import 'package:innovation/views/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final user = Auth.fauth.currentUser;

    // if user is already logged in take him to home page
    if (user != null) {
      Timer(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const HomePage()));
      });

      // else take him to login page
    } else {
      Timer(const Duration(milliseconds: 500), () {
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
