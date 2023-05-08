import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/widgets/buttons/dg_button.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text.dart';

class ShareQRScreen extends StatelessWidget {
  static const routeName = '/share-qr-screen';
  const ShareQRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          )),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 200, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        DgText(
                          'Scan QR Track',
                          type: DgTextType.title,
                        ),
                        DgText(
                          'Scan QR Code with your smart phone camera to track the delivery!',
                          type: DgTextType.body,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Icon(
                      Icons.qr_code,
                      size: 100,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: DGButton(const DgText('Share QR Code'),
                        variant: ButtonVariant.elevated, onTap: () {
                      // Navigator.of(context).pushNamed(
                      //   '/',
                      // );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
