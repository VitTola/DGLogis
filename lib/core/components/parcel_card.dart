import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_order_parcel.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text.dart';

// ignore: must_be_immutable
class ParcelCard extends StatelessWidget {
  //dummy data
  List<ShipmentOrderParcel> parcels;
  ParcelCard({super.key, required this.parcels});

  @override
  Widget build(BuildContext context) {
    var parcelAmount = parcels.length.toString();
    return Expandable(
      initiallyExpanded: true,
      arrowLocation: ArrowLocation.right,
      firstChild: Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 15, 10),
            child: DgText(
              'You have $parcelAmount parcel(s)',
              type: DgTextType.title,
            ),
          )),
      secondChild: Container(
        padding: const EdgeInsets.all(.8),
        child: Column(
          children: [
            for (var parcel in parcels)
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: _parcelItem(
                    parcel, '${parcels.indexOf(parcel) + 1}/$parcelAmount'),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _parcelItem(ShipmentOrderParcel parcel, String pageNumber) {
  // ignore: unnecessary_null_comparison
  if (parcel == null) return const Placeholder();
  return Card(
      color: Colors.grey[100],
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DgText(
                  pageNumber,
                  type: DgTextType.caption,
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DgText('Type : ${parcel.parcelType ?? ''}',
                          type: DgTextType.caption),
                      DgText('Weight : ${parcel.parcelWeight ?? ''}',
                          type: DgTextType.caption),
                      DgText('Dimension : ${parcel.parcelDimension ?? ''}',
                          type: DgTextType.caption),
                      DgText('Declare Value : ${parcel.declareValue ?? ''}',
                          type: DgTextType.caption),
                      DgText('Remarks : ${parcel.remarks ?? ''}',
                          type: DgTextType.caption),
                    ],
                  ),
                ),
                const Spacer(),
                Image.asset(parcel.image ?? '', width: 60, height: 60),
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      ));
}
