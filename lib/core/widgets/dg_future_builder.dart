import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/dialogs/loading_data_failed_dialog.dart';

class DGFutureBuilder<T> extends StatefulWidget {
  const DGFutureBuilder(
      {super.key,
      required this.futureFn,
      required this.builder,
      this.controller});

  final Future<T> Function() futureFn;
  final Widget Function(BuildContext context, T? data) builder;
  final FutureBuilderController? controller;

  @override
  State<DGFutureBuilder> createState() => _DGFutureBuilderState<T>();
}

class _DGFutureBuilderState<T> extends State<DGFutureBuilder<T>> {
  late Future<T> _datas;

  @override
  void initState() {
    super.initState();
    _datas = widget.futureFn();
    widget.controller?.requestRefresh = _loadData;
  }

  @override
  void didUpdateWidget(covariant DGFutureBuilder<T> oldWidget) {
    // Re-assign, due to reload page issue
    widget.controller?.requestRefresh ??= _loadData;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _datas,
      builder: (context, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return LoadDataFailed(
              onRetry: (context) {
                setState(() {
                  _datas = widget.futureFn();
                });
              },
            );
            // if we got our data
          }

          final data = snapshot.data;
          return widget.builder(context, data);
        }

        // Displaying LoadingSpinner to indicate waiting state
        return const LoadingWidget();
      },
    );
  }

  Future<void> _loadData() async {
    setState(() {
      _datas = widget.futureFn();
    });
  }
}

class FutureBuilderController {
  /// Called when called `pause` method
  void Function()? requestRefresh;

  ///
  /// Constructor
  ///
  FutureBuilderController([this.requestRefresh]);
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()));
  }
}
