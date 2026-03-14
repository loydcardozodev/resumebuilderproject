import 'package:flutter/material.dart';

class AddSection extends StatelessWidget {
  const AddSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add, color: Colors.deepPurple),
      label: const Text(
        'Add more section',
        style: TextStyle(color: Colors.deepPurple),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.grey[300],
        side: const BorderSide(color: Colors.deepPurple),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
