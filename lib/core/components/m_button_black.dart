import 'package:flutter/material.dart';

class MButtonBlack extends StatelessWidget {
  final Function()? onPressed;
  final String label;

  const MButtonBlack({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
