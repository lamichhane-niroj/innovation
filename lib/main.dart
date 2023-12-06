import 'package:flutter/material.dart';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:innovation/views/screens/splash_page.dart';
import 'package:innovation/providers/login_page_provider.dart';

void main() async {
  // initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyB8UZrwLwCc-FfALbekyuSYyiLDNTNrrdc",
          appId: "1:775059173277:android:a9c7f91a7d368d084a8974",
          messagingSenderId: "775059173277",
          projectId: "innovation-f9b56",
        ))
      : await Firebase.initializeApp();

  // for onboading screen
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('showHome') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime});

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(isFirstTime: isFirstTime)),
    );
  }
}
