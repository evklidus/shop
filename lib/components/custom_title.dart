import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.redAccent,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
