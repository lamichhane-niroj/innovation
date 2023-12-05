import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:innovation/components/button.dart';
import 'package:innovation/components/text_field.dart';
import 'package:innovation/views/signup_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _anim;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
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
                height: 35,
              ),

              // button
              const Button(text: "LOG IN"),

              const SizedBox(
                height: 40,
              ),

              const Text("Or Login With",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //For google Button
                  Card(
                    color: Colors.grey[200],
                    child: Icon(
                      MdiIcons.facebook,
                      size: 80,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Card(
                    color: Colors.grey[200],
                    child: Icon(
                      MdiIcons.google,
                      size: 80,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
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
