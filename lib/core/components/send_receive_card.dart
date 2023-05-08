import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_card_title.dart';
import 'package:skailab_dg_logis_app/core/components/m_card.dart';
import 'package:skailab_dg_logis_app/core/components/m_timelines.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_card_item.dart';
import 'package:skailab_dg_logis_app/scan_qr/shipment_details_screen.dart';

class SendReceiveCard extends StatelessWidget {
  final String status;

  SendReceiveCard({super.key, required this.status});

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
      onTap: () =>
          Navigator.of(context).pushNamed(ShipmentDetailScreen.routeName),
      child: MCard(
        backgroundColor: AppColor.sendReceiveGrey,
        header: Row(children: [
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
            decoration: const BoxDecoration(
              color: AppColor.boldGrey,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: const MCardTitle(
              label: '#t0vp-o1kd',
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                status,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                width: 24,
              ),
              const Icon(
                Icons.local_shipping,
                size: 48,
              ),
            ],
          ))
        ]),
        body: MTimeLines(locations: locations),
      ),
    );
  }
}
