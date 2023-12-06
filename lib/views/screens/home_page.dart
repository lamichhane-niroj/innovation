import 'package:flutter/material.dart';

import 'package:innovation/components/button.dart';
import 'package:innovation/controllers/auth_controller.dart';
import 'package:innovation/views/screens/login_page.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RoundedLoadingButtonController rlc = RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Button(
            rlc: rlc,
            text: "Log Out",
            onPressed: () {
              Auth.gauth.signOut();
              Auth.fauth.signOut();
              Auth.faceauth.logOut();

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ));
            }),
      ),
    );
  }
}
