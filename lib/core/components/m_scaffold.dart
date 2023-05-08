import 'package:flutter/material.dart';

class MScaffold extends StatelessWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final String? title;
  final Widget? body;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;
  final Color? backgroundColor;

  const MScaffold(
      {super.key,
      this.title,
      this.leading,
      this.actions,
      this.body,
      this.bottom,
      this.shape,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor:
          backgroundColor ?? const Color.fromRGBO(241, 241, 241, 1),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: shape,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: title != null
            ? Text(
                '$title',
                style: const TextStyle(color: Colors.black),
              )
            : null,
        leading: leading ??
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
        actions: actions,
        bottom: bottom,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
    );
  }
}
