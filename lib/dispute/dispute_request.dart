import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';
import 'package:skailab_dg_logis_app/core/components/shipment_card.dart';
import 'package:skailab_dg_logis_app/dispute/components/dispute_reasons_card.dart';
import 'package:skailab_dg_logis_app/dispute/models/dispute_reason.dart';

class DisputeRequest extends StatelessWidget {
  const DisputeRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: 'Open Dispute Case',
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShipmentCard(),
            DisputeReasonsCard(
              title: 'Tell us why',
              reasons: [
                DisputeReason('Broken', false),
                DisputeReason('Item missing', false),
                DisputeReason('Delivery Problem', false),
                DisputeReason('Dangerous Items', false),
                DisputeReason('Other', false),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/dispute-success'),
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
