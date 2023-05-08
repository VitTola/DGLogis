import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skailab_dg_logis_app/core/dialogs/loading_dialog.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text.dart';

class Utils {
  static Future<void> loadingDialog(BuildContext context,
      [String? message]) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return LoadingDialog(message);
      },
    );
  }
}

Future<void> loadingDialog(BuildContext context,
    [String? message, invisibleLoading = false]) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: invisibleLoading ? null : Colors.black54,
    useRootNavigator: false,
    builder: (BuildContext context) {
      if (invisibleLoading) return Container();
      return LoadingDialog(message);
    },
  );
}

void copyTextToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  showSnackBar(context, 'Copied $text');
}

void showSnackBar(
  BuildContext context,
  String message, {
  Color? color,
  bool permanant = false,
}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        //backgroundColor: color ?? AppColors.info,
        content: DgText(
          message,
          color: Colors.white,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
        duration:
            permanant ? const Duration(days: 100) : const Duration(seconds: 4),
      ),
    );
}
