import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_card_title.dart';
import 'package:skailab_dg_logis_app/core/components/m_card.dart';
import 'package:skailab_dg_logis_app/core/components/m_text_10.dart';

import '../consts/app_color.dart';

class PickUpCard extends StatelessWidget {
  const PickUpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MCard(
      backgroundColor: AppColor.sendReceiveGrey,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MCardTitle(label: 'Pick-up Card'),
                const SizedBox(
                  height: 6,
                ),
                const MText10(
                    label:
                        'Show this card to the counter to claim your parcel(s) ownership'),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: AppColor.black50,
                    ),
                    Text(
                      'Pick-up Point:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: AppColor.black50,
                      ),
                    )
                  ],
                ),
                const MText10(label: 'Virak Buntham Psa Beung Chhuk branch'),
                const MText10(label: 'St.106 Corner St. 101, Krong Battambang'),
                Row(
                  children: [
                    const MText10(label: 'Mobile:'),
                    GestureDetector(
                      child: const MText10(
                        label: '0127333572',
                        color: AppColor.blueLink,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const MText10(label: 'Click on the link '),
                    GestureDetector(
                      child: const MText10(
                        label: 'here',
                        color: AppColor.blueLink,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const MText10(label: ' for Google Map'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            children: const [
              Icon(
                Icons.qr_code,
                size: 72,
              ),
              Text(
                '#t0vp-o1kd',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
