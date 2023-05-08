import 'package:flutter/material.dart';

import '../consts/app_color.dart';

class MText10 extends StatelessWidget {
  final String label;
  final TextDecoration? decoration;
  final Color? color;

  const MText10({super.key, required this.label, this.decoration, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: 10,
          color: color ?? AppColor.black50,
          decoration: decoration),
    );
  }
}
