import 'package:flutter/material.dart';

class AddSection extends StatelessWidget {
  const AddSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.deepPurple),
          SizedBox(height: 30),
          Text('Add more section', style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}
