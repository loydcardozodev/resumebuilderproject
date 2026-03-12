import 'package:flutter/material.dart';

class NavButtons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;
  final String backLabel;
  final String nextLabel;

  const NavButtons({
    super.key,
    required this.onBack,
    required this.onNext,
    this.backLabel = 'Back',
    this.nextLabel = 'Next',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _OutlineButton(label: backLabel, onTap: onBack),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _FilledButton(label: nextLabel, onTap: onNext),
        ),
      ],
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _OutlineButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        side: const BorderSide(color: Colors.black),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class _FilledButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _FilledButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
