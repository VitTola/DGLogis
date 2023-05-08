import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_text_10.dart';

class MCard extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Color? backgroundColor;

  const MCard({super.key, this.header, this.body, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      color: backgroundColor,
      elevation: 0,
      child: Column(children: [
        Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: 12,
            ),
            child: header),
        Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16,
            ),
            child: body),
        const Divider(
          thickness: 1,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const MText10(
              label: 'Shipment via:',
            ),
            Image.asset(
              'assets/images/DHL-Emblem.png',
              width: 128,
              height: 32,
              fit: BoxFit.fitWidth,
            )
          ]),
        )
      ]),
    );
  }
}
