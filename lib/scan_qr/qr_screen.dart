import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';
import 'package:skailab_dg_logis_app/core/shared/utils.dart';
import 'package:skailab_dg_logis_app/core/widgets/buttons/dg_button.dart';
import 'package:skailab_dg_logis_app/scan_qr/shipment_details_screen.dart';

class QRScreen extends StatefulWidget {
  static const routeName = '/qr';
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  bool _isFlashOn = false;
  String barcodValue = '';

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _qrScanner(),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white30.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: IconButton(
                      color: AppColor.textColor,
                      icon: _isFlashOn
                          ? const Icon(
                              Icons.flash_on,
                            )
                          : const Icon(
                              Icons.flash_off,
                            ),
                      onPressed: () {
                        setState(() {
                          _isFlashOn = !_isFlashOn;
                        });
                        controller!.toggleFlash();
                      },
                    ),
                  ),
                  const SizedBox(height: 80),
                  DGButton(
                    const Text(
                      'Upload image',
                      style: TextStyle(color: AppColor.textColor),
                    ),
                    onTap: _pickImage,
                    variant: ButtonVariant.round,
                    backgroundColor: Colors.white30.withOpacity(0.2),
                  ),
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: DGButton(
                            const Text(
                              'Enter tracking code',
                              style: TextStyle(color: AppColor.textColor),
                            ),
                            onTap: _enterTrackingCode,
                            variant: ButtonVariant.elevated,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
          Positioned(
            top: 35,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white30.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColor.textColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _qrScanner() {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      formatsAllowed: const [BarcodeFormat.qrcode],
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onViewCreated,
      overlay: QrScannerOverlayShape(
          borderRadius: 5,
          borderColor: Colors.blue,
          borderLength: 30,
          borderWidth: 5,
          cutOutSize: scanArea,
          cutOutBottomOffset: 120),
    );
  }

  void _onViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      barcodValue = scanData.code ?? '';
      if (barcodValue != '') {
        controller.pauseCamera();
        _handleScanResult();
      }
    });
  }

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final qrCodeResult = await Scan.parse(pickedFile.path);

      // ignore: unnecessary_null_comparison
      if (qrCodeResult != null) {
        setState(() {
          barcodValue = qrCodeResult;
        });
        _handleScanResult();
      } else {}
    }
  }

  void _enterTrackingCode() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _focusNode = FocusNode();

    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _textController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter tracking code'),
          content: TextField(
            focusNode: _focusNode,
            textInputAction: TextInputAction.go,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Tracking code',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  barcodValue = _textController.text;
                });
                Navigator.of(context).pop();
                _handleScanResult();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _handleScanResult() async {
    // show loading dialog when request api
    Utils.loadingDialog(context);
    await Future.delayed(const Duration(milliseconds: 1000));
    // ignore: use_build_context_synchronously
    Navigator.pop(context);

    if (barcodValue != '') {
      // if valid qr code
      if (barcodValue.contains('ok')) {
        controller!.dispose();
        // ignore: use_build_context_synchronously
        await Navigator.pushNamed(context, ShipmentDetailScreen.routeName);
      }
      // if not valid qr code
      else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white30.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Image.asset(
                    'assets/images/image_placeholder.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('No Results Found'),
              ],
            ),
          ),
        );
        controller!.resumeCamera();
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
