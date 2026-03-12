import 'package:flutter/material.dart';

class FormFieldLabel extends StatelessWidget {
  final String text;
  const FormFieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
