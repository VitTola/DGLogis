import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skailab_dg_logis_app/core/components/m_button_black.dart';
import 'package:skailab_dg_logis_app/core/components/order_timeline.dart';
import 'package:skailab_dg_logis_app/core/components/parcel_card.dart';
import 'package:skailab_dg_logis_app/core/components/shipment_card.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_order_parcel.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text.dart';
import 'package:skailab_dg_logis_app/scan_qr/share_qr.dart';

import '../core/components/m_button_white.dart';
import '../rate/rating_delivery_screen.dart';

class ShipmentDetailScreen extends StatefulWidget {
  static const routeName = '/ship-details';

  const ShipmentDetailScreen({super.key});

  @override
  State<ShipmentDetailScreen> createState() => _ShipmentDetailScreenState();
}

class _ShipmentDetailScreenState extends State<ShipmentDetailScreen> {
  @override
  Widget build(BuildContext context) {
//dummy data
    List<ShipmentOrderParcel> dummyParcels = [
      ShipmentOrderParcel(
        parcelType: 'Parcel',
        parcelWeight: '1.5kg',
        parcelDimension: '20x20x20cm',
        declareValue: 'RM 100',
        remarks: 'Fragile',
        image: 'assets/images/image_placeholder.png',
      ),
      ShipmentOrderParcel(
        parcelType: 'Parcel',
        parcelWeight: '1.5kg',
        parcelDimension: '20x20x20cm',
        declareValue: 'RM 100',
        remarks: 'Fragile',
        image: 'assets/images/image_placeholder.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Expanded(
            child: Center(
                child: DgText(
          "Shipment Details",
          type: DgTextType.title,
        ))),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () {
              Navigator.pushNamed(context, ShareQRScreen.routeName);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                _description(),
                const SizedBox(height: 40),
                const OrderTimeline(),
                const SizedBox(height: 40),
                ShipmentCard(
                  enableClick: false,
                ),
                const SizedBox(height: 20),
                ParcelCard(
                  parcels: dummyParcels,
                ),
                const SizedBox(height: 20),
                _totalPriceCard(),
                const SizedBox(height: 20),
                MButtonWhite(
                  label: 'Open Dispute',
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/dispute-request'),
                ),
                const SizedBox(height: 20),
                MButtonBlack(
                  label: 'Leave a review',
                  onPressed: () => Navigator.of(context)
                      .pushNamed(RatingDeliveryScreen.routeName),
                ),
              ],
            )),
      ),
    );
  }

  Widget _description() {
    return Column(
      children: [
        Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 230,
                child: Column(
                  children: const [
                    DgText(
                      "Your shipment is In-Transit!",
                      type: DgTextType.title,
                    ),
                    DgText(
                      "We will notify you when it arrives at the destination",
                      type: DgTextType.body,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(LineIcons.truckMoving,
                    size: 40, color: AppColor.deliveryInState),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _totalPriceCard() {
    return Expandable(
      initiallyExpanded: true,
      firstChild: const Expanded(
          child: Padding(
        padding: EdgeInsets.fromLTRB(25, 15, 15, 10),
        child: DgText(
          'Total Price',
          type: DgTextType.title,
        ),
      )),
      secondChild: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                        flex: 2,
                        child:
                            DgText("Shipment Fee", type: DgTextType.caption)),
                    Expanded(
                      flex: 3,
                      child: DgText("R 16,000",
                          textAlign: TextAlign.right, type: DgTextType.caption),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(
                        flex: 3,
                        child: DgText("Shipping Type (Standard)",
                            type: DgTextType.caption)),
                    Expanded(
                      flex: 1,
                      child: DgText("R 0",
                          textAlign: TextAlign.right, type: DgTextType.caption),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(
                        flex: 3,
                        child: DgText("+Door-to-Door Service Fee",
                            type: DgTextType.caption)),
                    Expanded(
                      flex: 1,
                      child: DgText("N/A",
                          textAlign: TextAlign.right, type: DgTextType.caption),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(
                        flex: 3,
                        child: DgText("Insurance Fee (Standard)",
                            type: DgTextType.caption)),
                    Expanded(
                      flex: 1,
                      child: DgText("R 1,600",
                          textAlign: TextAlign.right, type: DgTextType.caption),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(
                        flex: 3,
                        child: DgText("---PAID #100FT3118479676",
                            type: DgTextType.caption)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(flex: 2, child: DgText("VAT (10%)")),
                    Expanded(
                      flex: 3,
                      child: DgText("R 1,800",
                          textAlign: TextAlign.right, type: DgTextType.caption),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Row(
                children: const [
                  Expanded(
                      flex: 2,
                      child: DgText(
                        "Total",
                        type: DgTextType.title,
                      )),
                  Spacer(),
                  Expanded(
                      flex: 3,
                      child: DgText(
                        "R 100",
                        type: DgTextType.title,
                        textAlign: TextAlign.right,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
