import 'package:flutter/material.dart';
import 'form_field_label.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final int maxLines;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.maxLines = 1,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldLabel(label),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(hintText: hint, suffixIcon: suffixIcon),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
