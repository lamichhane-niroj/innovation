import 'dart:async';
import 'package:flutter/material.dart';

import 'package:innovation/components/button.dart';
import 'package:innovation/components/text_field.dart';
import 'package:innovation/controllers/auth_controller.dart';
import 'package:innovation/providers/login_page_provider.dart';
import 'package:innovation/views/screens/home_page.dart';
import 'package:innovation/views/screens/login_page.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  RoundedLoadingButtonController rlc = RoundedLoadingButtonController();
  late AnimationController _controller;
  late Animation<double> _anim;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 500));
    _anim = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    const Icon(
                      Icons.all_inclusive_outlined,
                      size: 80,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
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
                height: 50,
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
                height: 20,
              ),

              // password field
              TextFieldBox(
                  controller: _confirmPasswordController,
                  hintText: "Confirm Password",
                  isObscure: true),

              const SizedBox(
                height: 35,
              ),

              // button
              Consumer<LoginProvider>(
                builder: (context, value, child) => Button(
                    text: "REGISTER",
                    rlc: value.getRegisterCont,
                    onPressed: () async {
                      bool signedIn = await Auth().signupUser(
                          _emailController.text,
                          _passwordController.text,
                          context);
                      if (signedIn) {
                        value.setSucessRegister();
                        Timer(
                            const Duration(milliseconds: 800),
                            () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                )));
                      } else {
                        value.resetRegister();
                      }
                    }),
              ),

              const SizedBox(
                height: 40,
              ),

              const SizedBox(
                height: 50,
              ),
              // send to register page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        )),
                    child: const Text(
                      "Login",
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
