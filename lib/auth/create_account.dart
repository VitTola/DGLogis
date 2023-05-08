import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_button_black.dart';
import 'package:skailab_dg_logis_app/core/components/m_page_title.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const MPageTitle(
            title: 'Create a new account',
            subtitle: 'Please input your phone number',
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
          const SizedBox(
            height: 75,
          ),
          MButtonBlack(
            label: 'Let\'s go',
            onPressed: () => Navigator.of(context).pushNamed('/auth/otp'),
          )
        ]),
      ),
    );
  }
}
