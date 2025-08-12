import 'package:flutter/material.dart';

class TextLinks extends StatelessWidget {
  final String text;

  const TextLinks({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.indigo,
          fontSize: 12,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
