import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_card.dart';
import 'package:skailab_dg_logis_app/core/components/m_text_10.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_card_item.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/copyable_text.dart';
import '../../scan_qr/shipment_details_screen.dart';
import '../consts/app_color.dart';
import 'm_timelines.dart';

class ShipmentCard extends StatelessWidget {
  final void Function()? onTap;
  final bool enableClick;
  final Color? backgroundColor;

  ShipmentCard(
      {super.key, this.onTap, this.enableClick = true, this.backgroundColor});

  final List<ShipmentLocation> locations = [
    ShipmentLocation(
      name: 'Phnom Penh',
      address: 'One Park, A23A, Dung Penh, Beong kok, Phnom Penh',
      contact: 'Dara | 069 *** 222',
    ),
    ShipmentLocation(
      name: 'Battambang',
      address: 'Virak Buntham Psa Beung Chhuk branch',
      contact: 'Vuthea | 012 *** 383',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!enableClick) {
          return;
        }
        if (onTap != null) {
          onTap!();
        } else {
          Navigator.of(context).pushNamed(ShipmentDetailScreen.routeName);
        }
      },
      child: MCard(
        backgroundColor: AppColor.carColor,
        header:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CopyableText(text: "#0vp-o1kd"),
                const MText10(label: 'Created on 21/04/2023 at 03:39 PM'),
                Row(
                  children: [
                    const MText10(label: 'Your shipment is fully protected. '),
                    GestureDetector(
                      child: const MText10(
                        label: 'Read More!',
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Icon(
            Icons.verified_user,
            size: 48,
          )
        ]),
        body: MTimeLines(locations: locations),
      ),
    );
  }
}
