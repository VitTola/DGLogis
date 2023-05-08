import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyableText extends StatelessWidget {
  final String text;

  const CopyableText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // alignment: Alignment.topRight,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: text));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Copied to clipboard')),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Icon(Icons.copy, size: 16.0),
          ),
        ),
      ],
    );
  }
}
