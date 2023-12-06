import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.rlc});

  final String text;
  final RoundedLoadingButtonController rlc;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: RoundedLoadingButton(
        successColor: Colors.green,
        controller: rlc,
        onPressed: onPressed,
        borderRadius: 12,
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
