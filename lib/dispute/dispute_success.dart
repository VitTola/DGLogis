import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/widgets/buttons/dg_button.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text.dart';

class DisputeSuccess extends StatelessWidget {
  static const routeName = '/thanks-screen';
  const DisputeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/placeholder.png'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const DgText(
                    'TYour request has been submitted successfully!',
                    type: DgTextType.titleMeduim,
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
                  child: DGButton(const DgText('Home'),
                      variant: ButtonVariant.elevated, onTap: () {
                    Navigator.of(context).pushNamed(
                      '/',
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
