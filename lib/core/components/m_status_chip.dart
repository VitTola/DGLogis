import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';

class MStatusChip extends StatelessWidget {
  final String status;
  final Color? statusColor;

  const MStatusChip({super.key, required this.status, this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 130,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: statusColor ?? AppColor.boldGrey,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        status,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      ),
    );
  }
}
