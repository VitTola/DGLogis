import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text.dart';

class LoadDataFailed extends StatelessWidget {
  const LoadDataFailed({Key? key, this.onRetry}) : super(key: key);

  final void Function(BuildContext context)? onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Theme.of(context).dividerColor,
              ),
              const SizedBox(height: 24.0),
              DgText(
                'Failed to load data. Please try again.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              if (onRetry != null)
                IconButton(
                  onPressed: () => onRetry!(context),
                  color: Theme.of(context).primaryColor,
                  iconSize: 35,
                  icon: const Icon(Icons.refresh_outlined),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
