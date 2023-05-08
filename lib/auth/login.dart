import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_button_black.dart';
import 'package:skailab_dg_logis_app/core/components/m_page_title.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const MPageTitle(
            title: 'Login into your account',
            subtitle: 'Please input your credential',
          ),
          const Text('Phone Number'),
          const SizedBox(
            height: 4,
          ),
          const TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Input text',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Password'),
          const SizedBox(
            height: 4,
          ),
          const TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Input text',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/auth/otp'),
              child: const Text(
                'Forgot the password',
                style: TextStyle(
                    color: AppColor.timelineTitleGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24),
          MButtonBlack(
            label: 'Let\'s go',
            onPressed: () => Navigator.pop(context),
          ),
        ]),
      ),
    );
  }
}
