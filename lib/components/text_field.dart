import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isObscure = false});

  final TextEditingController controller;
  final bool isObscure;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
