import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotFoundDialog extends StatelessWidget {
  const NotFoundDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/image_placeholder.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 16),
                const Text('No Results Found'),
              ],
            ),
          );
        },
      );
    });
    return const SizedBox.shrink();
  }
}
