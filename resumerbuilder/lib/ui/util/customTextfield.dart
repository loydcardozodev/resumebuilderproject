import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: text, border: OutlineInputBorder()),
    );
  }
}
