import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "assets/messenging.jpg",
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "ENHANCE YOUR CREATIVITY",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Enhance your creativity by exploring the world best innovation and ideas. May this triggers the creative soul inside you",
          style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
