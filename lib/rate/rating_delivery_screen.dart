import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skailab_dg_logis_app/core/components/shipment_card.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_order_parcel.dart';
import 'package:skailab_dg_logis_app/core/widgets/buttons/dg_button.dart';
import 'package:skailab_dg_logis_app/core/widgets/dg_future_builder.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_input_counter.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text.dart';
import 'package:skailab_dg_logis_app/rate/thanks_screen.dart';

class RatingDeliveryScreen extends StatefulWidget {
  static const routeName = '/rating-delivery-screen';
  const RatingDeliveryScreen({super.key});

  @override
  State<RatingDeliveryScreen> createState() => _RatingDeliveryScreenState();
}

class _RatingDeliveryScreenState extends State<RatingDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return DGFutureBuilder<ShipmentOrderParcel?>(
      futureFn: () async {
        return null;
      },
      builder: (context, data) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.iconColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const DgText(
            'Rating Delivery',
            type: DgTextType.title,
            color: Colors.black,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShipmentCard(
                    enableClick: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _overallRating(),
                  const SizedBox(
                    height: 10,
                  ),
                  _allRating(),
                  const SizedBox(
                    height: 10,
                  ),
                  _enterCommentCard(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: DGButton(const DgText('Submit'),
                              variant: ButtonVariant.elevated, onTap: () {
                            Navigator.of(context).pushNamed(
                              ThanksScreen.routeName,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _enterCommentCard() => SizedBox(
        height: 230,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DgText(
                  'Any thing you would like to share',
                  type: DgTextType.title,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                Flexible(
                  child: DgInputTextCounter(
                    maxLength: 200,
                    hintText: 'Describe here',
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _overallRating() => SizedBox(
        height: 130,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DgText(
                  'Overall Rating',
                  type: DgTextType.title,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                _ratingItem(label: 'Overall', onRatingUpdate: _onOverallUpdate),
              ],
            ),
          ),
        ),
      );

  Widget _allRating() => SizedBox(
        height: 240,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DgText(
                  'Tell us your experience',
                  type: DgTextType.title,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                _ratingItem(label: 'Package', onRatingUpdate: _onPackageUpdate),
                const SizedBox(
                  height: 10,
                ),
                _ratingItem(
                    label: 'Delivery Service',
                    onRatingUpdate: _onDeliveryServiceUpdate),
                const SizedBox(
                  height: 10,
                ),
                _ratingItem(
                    label: 'Speed delivery',
                    onRatingUpdate: _onSpeedDeliveryUpdate),
              ],
            ),
          ),
        ),
      );

  void _onOverallUpdate(double rating) {}
  void _onPackageUpdate(double rating) {}
  void _onDeliveryServiceUpdate(double rating) {}
  void _onSpeedDeliveryUpdate(double rating) {}

  Widget _ratingItem({
    required final String label,
    required final Function(double) onRatingUpdate,
  }) =>
      Flexible(
        child: Row(
          children: [
            DgText(
              label,
            ),
            const Spacer(),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (_, __) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                onRatingUpdate(rating);
              },
            ),
          ],
        ),
      );
}
