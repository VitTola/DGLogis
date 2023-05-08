import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_card.dart';
import 'package:skailab_dg_logis_app/core/components/m_card_title.dart';
import 'package:skailab_dg_logis_app/core/components/m_status_chip.dart';
import 'package:skailab_dg_logis_app/core/components/m_text_10.dart';
import 'package:skailab_dg_logis_app/core/components/m_timelines.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_card_item.dart';

class DisputeCard extends StatelessWidget {
  final String status;
  final Color? statusColor;

  DisputeCard({super.key, required this.status, this.statusColor});

  final List<ShipmentLocation> locations = [
    ShipmentLocation(
      name: 'Phnom Penh',
      address: 'One Park, A23A, Dung Penh, Beong kok, Phnom Penh',
      contact: '069 *** 222',
    ),
    ShipmentLocation(
      name: 'Battambang',
      address: 'Virak Buntham Psa Beung Chhuk branch',
      contact: '012 *** 383',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/dispute-details'),
      child: MCard(
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    MText10(label: 'Case ID:'),
                    MCardTitle(
                      label: '#7893789325775',
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                MStatusChip(
                  status: status,
                  statusColor: statusColor,
                ),
              ],
            ),
            const Text(
              'Shipment Code: t0vp-o1kd',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [MTimeLines(locations: locations)],
        ),
      ),
    );
  }
}
