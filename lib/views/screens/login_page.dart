import 'dart:async';
import 'package:flutter/material.dart';

import 'package:innovation/components/button.dart';
import 'package:innovation/components/rounded_button.dart';
import 'package:innovation/components/text_field.dart';
import 'package:innovation/controllers/auth_controller.dart';
import 'package:innovation/providers/login_page_provider.dart';
import 'package:innovation/views/screens/home_page.dart';
import 'package:innovation/views/screens/signup_page.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  RoundedLoadingButtonController rlc = RoundedLoadingButtonController();

  // controllers
  late AnimationController _controller;
  late Animation<double> _anim;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // sweep animation
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 500));
    _anim = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
    super.initState();
  }

  // clear the chunks
  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Scaffold(
        body: Transform(
          transform: Matrix4.translationValues(_anim.value * width, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo and brand name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  children: [
                    // brand logo
                    const Icon(
                      Icons.all_inclusive_outlined,
                      size: 80,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // animation
                    Column(
                      children: [
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText('INNOVATION',
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 45),
                                speed: const Duration(milliseconds: 100)),
                          ],
                        ),
                        // brand slogan
                        const Text(
                          "A Creative Social App",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // email field
              TextFieldBox(
                controller: _emailController,
                hintText: "Email",
              ),

              const SizedBox(
                height: 20,
              ),

              // password field
              TextFieldBox(
                  controller: _passwordController,
                  hintText: "Password",
                  isObscure: true),

              const SizedBox(
                height: 35,
              ),

              //login button
              Consumer<LoginProvider>(
                builder: (context, value, child) => Button(
                    text: "LOG IN",
                    rlc: value.getLoginCont,
                    onPressed: () async {
                      bool signedIn = await Auth().loginUser(
                          _emailController.text,
                          _passwordController.text,
                          context);

                      if (signedIn) {
                        value.setSucessLogin();
                        Timer(
                            const Duration(milliseconds: 800),
                            () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                )));
                      } else {
                        value.resetLogin();
                      }
                    }),
              ),

              const SizedBox(
                height: 40,
              ),

              // alternate login options
              const Text("Or Login With",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              const SizedBox(
                height: 15,
              ),

              Column(
                children: [
                  Consumer<LoginProvider>(
                      builder: (context, value, child) => RoundedButton(
                          rc: value.getGoogleCont,
                          onPressed: () async {
                            bool signedIn = await Auth().googleSignIn(context);

                            if (signedIn) {
                              value.setSucessGoogle();
                              Timer(
                                  const Duration(seconds: 1),
                                  () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      )));
                            } else {
                              value.resetGoogle();
                            }
                          },
                          fontWeight: FontWeight.w500,
                          icon: FontAwesomeIcons.google,
                          size: 15,
                          text: "Sign in with Google")),

                  const SizedBox(
                    height: 10,
                  ),

                  // facebook sign in button
                  Consumer<LoginProvider>(
                      builder: (context, value, child) => RoundedButton(
                          onPressed: () async {
                            bool signedIn =
                                await Auth().facebookSignIn(context);

                            if (signedIn) {
                              value.setSucessFacebook();
                              Timer(
                                  const Duration(milliseconds: 800),
                                  () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      )));
                            } else {
                              value.resetFacebook();
                            }
                          },
                          rc: value.getFacebookCont,
                          fontWeight: FontWeight.w500,
                          icon: FontAwesomeIcons.facebook,
                          size: 15,
                          text: "Sign in with Facebook")),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // send to register page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        )),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
