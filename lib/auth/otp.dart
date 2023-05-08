import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:skailab_dg_logis_app/core/components/m_page_title.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';

class OTP extends StatelessWidget {
  OTP({super.key});

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(6),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MPageTitle(
              title: 'OTP',
              subtitle: 'Please input your otp code',
            ),
            Pinput(
              length: 5,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme,
              submittedPinTheme: defaultPinTheme,
              validator: (s) {
                return s == '22222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => Navigator.of(context)
                  .pushNamedAndRemoveUntil(
                      '/auth/set-password', ModalRoute.withName('/auth/main')),
            )
          ],
        ),
      ),
    );
  }
}
