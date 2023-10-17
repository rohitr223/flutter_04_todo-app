import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  Color buttonColor;
  VoidCallback onPressed;

  AppButton(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
