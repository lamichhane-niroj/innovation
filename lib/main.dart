import 'package:flutter/material.dart';

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:innovation/providers/login_page_provider.dart';

import 'package:innovation/views/splash_page.dart';
import 'package:provider/provider.dart';

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

  runApp(const MyApp());
}

class DefaultFirebaseOptions {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
