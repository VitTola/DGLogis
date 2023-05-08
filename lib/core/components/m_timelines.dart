import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_text_10.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_card_item.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MTimeLines extends StatelessWidget {
  final List<ShipmentLocation> locations;
  final bool defaultIndicator;

  const MTimeLines(
      {super.key, required this.locations, this.defaultIndicator = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: locations
          .asMap()
          .entries
          .map(
            (entry) => TimelineTile(
              isFirst: entry.key == 0,
              isLast: entry.key == locations.length - 1,
              indicatorStyle: IndicatorStyle(
                width: 10,
                color: Colors.grey,
                padding: const EdgeInsets.only(right: 12),
                indicatorXY: (entry.key == locations.length - 1)
                    ? !defaultIndicator
                        ? 1
                        : 0.2
                    : 0.125,
                indicator:
                    (entry.key == locations.length - 1 && !defaultIndicator)
                        ? Image.asset('assets/images/marker.png')
                        : null,
              ),
              endChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.value.name,
                      style: const TextStyle(
                        color: AppColor.timelineTitleGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MText10(label: entry.value.contact),
                    MText10(label: entry.value.address),
                    if (entry.key != locations.length - 1)
                      const SizedBox(
                        height: 16,
                      ),
                  ]),
              beforeLineStyle: const LineStyle(
                color: AppColor.timelineGrey,
                thickness: 1,
              ),
            ),
          )
          .toList(),
    );
  }
}
