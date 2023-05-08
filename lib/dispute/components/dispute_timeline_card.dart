import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_timelines.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_card_item.dart';

class DisputeTimelineCard extends StatefulWidget {
  const DisputeTimelineCard({super.key});

  @override
  State<StatefulWidget> createState() => _DisputeTimelineCardState();
}

class _DisputeTimelineCardState extends State<DisputeTimelineCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) =>
            setState(() => _isExpanded = !_isExpanded),
        children: [
          ExpansionPanel(
            isExpanded: _isExpanded,
            headerBuilder: (context, isOpen) => Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Dispute Timeline',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: MTimeLines(defaultIndicator: true, locations: [
                ShipmentLocation(
                  name: 'Rejected',
                  contact: '24/04/2023 at 03:24:00 PM',
                  address: 'Dispute case has been rejected',
                ),
                ShipmentLocation(
                  name: 'Resolved',
                  contact: '24/04/2023 at 03:24:00 PM',
                  address: 'Dispute case has been resolved',
                ),
                ShipmentLocation(
                  name: 'Processing',
                  contact: '24/04/2023 at 03:24:00 PM',
                  address: 'Dispute case has been processed',
                ),
                ShipmentLocation(
                  name: 'Requested',
                  contact: '24/04/2023 at 03:24:00 PM',
                  address: 'Dispute case is submitted for review',
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
