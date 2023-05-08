import 'package:flutter/material.dart';

class MCardTitle extends StatelessWidget {
  final String label;
  final FontWeight? fontWeight;
  final double? fontSize;

  const MCardTitle({
    super.key,
    required this.label,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w500, fontSize: fontSize ?? 20),
    );
  }
}
