import 'package:go_router/go_router.dart';
import 'package:skailab_dg_logis_app/auth/create_account.dart';
import 'package:skailab_dg_logis_app/auth/login.dart';
import 'package:skailab_dg_logis_app/auth/otp.dart';
import 'package:skailab_dg_logis_app/auth/set_password.dart';
import 'package:skailab_dg_logis_app/dispute/dispute_details.dart';
import 'package:skailab_dg_logis_app/dispute/dispute_list.dart';
import 'package:skailab_dg_logis_app/dispute/dispute_request.dart';
import 'package:skailab_dg_logis_app/dispute/dispute_success.dart';
import 'package:skailab_dg_logis_app/home/home.dart';
import 'package:skailab_dg_logis_app/rate/rating_delivery_screen.dart';
import 'package:skailab_dg_logis_app/rate/thanks_screen.dart';
import 'package:skailab_dg_logis_app/receive_list/receive_list.dart';
import 'package:skailab_dg_logis_app/scan_qr/qr_screen.dart';
import 'package:skailab_dg_logis_app/scan_qr/share_qr.dart';
import 'package:skailab_dg_logis_app/scan_qr/shipment_details_screen.dart';
import 'package:skailab_dg_logis_app/search_by_tracking_id/search_screen.dart';
import 'package:skailab_dg_logis_app/send_list/send_list.dart';
import 'package:skailab_dg_logis_app/splash/splash_screen.dart';

class AppRoute {
  static const splash = '/splash';
  static const home = '/home';
  static const authMain = '/auth/main';
  static const authLogin = '/auth/login';
  static const authRegister = '/auth/register';
  static const authSetPassword = '/auth/set-password';
  static const authOtp = '/auth/otp';
  static const sendList = '/send-list';
  static const receiveList = '/receive-list';
  static const disputeList = '/dispute-list';
  static const disputeRequest = '/dispute-request';
  static const disputeSuccess = '/dispute-success';
  static const disputeDetails = '/dispute-details';
  static const qRScreen = '/qr-screen';
  static const shipmentDetailScreen = '/shipment-detail-screen';
  static const shareQRScreen = '/share-qr-screen';
  static const searchScreen = '/search-screen';
  static const ratingDeliveryScreen = '/rating-delivery-screen';
  static const thanksScreen = '/thanks-screen';

  static final GoRouter routeConfig = GoRouter(
    initialLocation: splash,
    routes: _configs,
    redirect: (context, state) {},
  );

  static final List<RouteBase> _configs = [
    GoRoute(
      name: splash,
      path: splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(name: home, path: home, builder: (context, state) => const Home()),
    GoRoute(
        name: authLogin,
        path: authLogin,
        builder: (context, state) => const Login()),
    GoRoute(
        name: authRegister,
        path: authRegister,
        builder: (context, state) => const CreateAccount()),
    GoRoute(
        name: authSetPassword,
        path: authSetPassword,
        builder: (context, state) => const SetPassword()),
    GoRoute(path: authOtp, name: authOtp, builder: (context, state) => OTP()),
    GoRoute(
        path: sendList,
        name: sendList,
        builder: (context, state) => const SendList()),
    GoRoute(
        path: receiveList,
        name: receiveList,
        builder: (context, state) => const ReceiveList()),
    GoRoute(
        path: disputeList,
        name: disputeList,
        builder: (context, state) => const DisputeList()),
    GoRoute(
        path: disputeRequest,
        name: disputeRequest,
        builder: (context, state) => const DisputeRequest()),
    GoRoute(
        path: disputeSuccess,
        name: disputeSuccess,
        builder: (context, state) => const DisputeSuccess()),
    GoRoute(
        path: disputeDetails,
        name: disputeDetails,
        builder: (context, state) => const DisputeDetails()),
    GoRoute(
        path: qRScreen,
        name: qRScreen,
        builder: (context, state) => const QRScreen()),
    GoRoute(
        path: shipmentDetailScreen,
        name: shipmentDetailScreen,
        builder: (context, state) => const ShipmentDetailScreen()),
    GoRoute(
        path: shareQRScreen,
        name: shareQRScreen,
        builder: (context, state) => const ShareQRScreen()),
    GoRoute(
        path: searchScreen,
        name: searchScreen,
        builder: (context, state) => const SearchScreen()),
    GoRoute(
        path: ratingDeliveryScreen,
        name: ratingDeliveryScreen,
        builder: (context, state) => const RatingDeliveryScreen()),
    GoRoute(
        path: thanksScreen,
        name: thanksScreen,
        builder: (context, state) => const ThanksScreen()),
  ];
}
