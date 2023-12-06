import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "assets/findnewfriends.jpg",
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "EXPAND YOUR CONTACT",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Communicate and share the idea with the real world, expand your contact and present your thoughts",
          style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
