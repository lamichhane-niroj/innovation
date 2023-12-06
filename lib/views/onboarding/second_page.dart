import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "assets/sharefiles.jpg",
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "SHARE YOUR THOUGHTS",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Share your ideas to get the real world support and judgement on your ideas and to enhance your branding",
          style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
