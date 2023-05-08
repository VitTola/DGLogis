import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_card_title.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';
import 'package:skailab_dg_logis_app/core/components/m_status_chip.dart';
import 'package:skailab_dg_logis_app/core/components/m_text_10.dart';
import 'package:skailab_dg_logis_app/core/components/shipment_card.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';
import 'package:skailab_dg_logis_app/dispute/components/dispute_timeline_card.dart';
import 'package:skailab_dg_logis_app/dispute/models/dispute_reason.dart';

import 'components/dispute_reasons_card.dart';

class DisputeDetails extends StatelessWidget {
  const DisputeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: 'Dispute Details',
      body: SingleChildScrollView(
        child: Column(children: [
          Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: 12,
              ),
              child: Row(
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
                    ],
                  ),
                  const MStatusChip(
                    status: 'Processing',
                    statusColor: AppColor.boldYellow,
                  ),
                ],
              ),
            ),
          ),
          ShipmentCard(
            backgroundColor: Colors.white,
          ),
          DisputeReasonsCard(
            title: 'Reasons',
            reasons: [DisputeReason('Broken', true)],
          ),
          const SizedBox(height: 24),
          const DisputeTimelineCard()
        ]),
      ),
    );
  }
}
