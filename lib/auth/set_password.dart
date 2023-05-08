import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_page_title.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';

import '../core/components/m_button_black.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MPageTitle(
          title: 'Set Password',
          subtitle: 'Please input your password',
        ),
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
        const SizedBox(
          height: 75,
        ),
        MButtonBlack(
          label: 'Let\'s go',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ));
  }
}
