import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/shared/utils.dart';

class Runner {
  static Future<T?>? executeAsync<T>(Future<T> Function() task,
      {String? message,
      void Function(Object error)? onError,
      bool invisibleLoading = false,
      required BuildContext context}) async {
    T? result;
    BuildContext? currentContext;
    currentContext = context;

    // if (context != null) {
    //   currentContext = context;
    // } else {
    //   currentContext = Application.context;
    // }

    loadingDialog(currentContext, message, invisibleLoading);
    try {
      result = await task();
    } catch (ex) {
      if (onError != null) {
        onError(ex);
      }
    } finally {
      Navigator.of(currentContext).pop();
    }
    return result;
  }
}
