import 'package:flutter/material.dart';

class MPageTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const MPageTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      if (subtitle != null)
        MPageSubtitle(
          subtitle: '$subtitle',
        )
    ]);
  }
}

class MPageSubtitle extends StatelessWidget {
  final String subtitle;

  const MPageSubtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 10,
      ),
      Text(
        subtitle,
        style: const TextStyle(fontSize: 10),
      ),
      const SizedBox(
        height: 36,
      ),
    ]);
  }
}
