import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/auth/login.dart';
import 'package:skailab_dg_logis_app/dispute/dispute_details.dart';
import 'package:skailab_dg_logis_app/dispute/dispute_success.dart';
import 'package:skailab_dg_logis_app/home/home.dart';
import 'package:skailab_dg_logis_app/auth/auth_main.dart';
import 'package:skailab_dg_logis_app/auth/create_account.dart';
import 'package:skailab_dg_logis_app/auth/otp.dart';
import 'package:skailab_dg_logis_app/auth/set_password.dart';
import 'package:skailab_dg_logis_app/dispute/dispute_request.dart';
import 'package:skailab_dg_logis_app/rate/rating_delivery_screen.dart';
import 'package:skailab_dg_logis_app/rate/thanks_screen.dart';
import 'package:skailab_dg_logis_app/receive_list/receive_list.dart';
import 'package:skailab_dg_logis_app/scan_qr/share_qr.dart';
import 'package:skailab_dg_logis_app/send_list/send_list.dart';
import 'dispute/dispute_list.dart';
import 'package:skailab_dg_logis_app/scan_qr/qr_screen.dart';
import 'package:skailab_dg_logis_app/scan_qr/shipment_details_screen.dart';
import 'package:skailab_dg_logis_app/search_by_tracking_id/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DG Logis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/auth/main': (context) => const AuthMain(),
        '/auth/login': (context) => const Login(),
        '/auth/register': (context) => const CreateAccount(),
        '/auth/set-password': (context) => const SetPassword(),
        '/auth/otp': (context) => OTP(),
        '/send-list': (context) => const SendList(),
        '/receive-list': (context) => const ReceiveList(),
        '/dispute-list': (context) => const DisputeList(),
        '/dispute-request': (context) => const DisputeRequest(),
        '/dispute-success': (context) => const DisputeSuccess(),
        '/dispute-details': (context) => const DisputeDetails(),
        QRScreen.routeName: (context) => const QRScreen(),
        ShipmentDetailScreen.routeName: (context) =>
            const ShipmentDetailScreen(),
        ShareQRScreen.routeName: (context) => const ShareQRScreen(),

        //SearchByTrackingID
        SearchScreen.routeName: (context) => const SearchScreen(),

        //Rating Delivery
        RatingDeliveryScreen.routeName: (context) =>
            const RatingDeliveryScreen(),
        ThanksScreen.routeName: (context) => const ThanksScreen(),
      },
    );
  }
}
