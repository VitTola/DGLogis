import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  LoadingDialog([this.message]);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
            Text(
              message ?? "",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
