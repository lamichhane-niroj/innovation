import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.rc,
    required this.fontWeight,
    required this.icon,
    required this.size,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final double size;
  final FontWeight fontWeight;
  final RoundedLoadingButtonController rc;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      borderRadius: 12,
      successColor: Colors.green,
      color: Colors.black,
      controller: rc,
      onPressed: onPressed,
      child: Wrap(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(text,
              style: TextStyle(
                  color: Colors.white, fontSize: size, fontWeight: fontWeight)),
        ],
      ),
    );
  }
}
