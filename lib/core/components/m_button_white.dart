import 'package:flutter/material.dart';

class MButtonWhite extends StatelessWidget {
  final Function()? onPressed;
  final String label;

  const MButtonWhite({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
