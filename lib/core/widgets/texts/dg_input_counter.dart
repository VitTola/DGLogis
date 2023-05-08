import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class DgInputTextCounter extends StatefulWidget {
  const DgInputTextCounter({
    Key? key,
    this.hintText = '',
    this.maxLength = 200,
  }) : super(key: key);

  final String hintText;
  final int maxLength;

  @override
  _DgInputTextCounterState createState() => _DgInputTextCounterState();
}

class _DgInputTextCounterState extends State<DgInputTextCounter> {
  final TextEditingController _textEditingController = TextEditingController();
  late int _currentLength;

  @override
  void initState() {
    super.initState();
    _currentLength = _textEditingController.text.length;
    _textEditingController.addListener(_updateCurrentLength);
  }

  void _updateCurrentLength() {
    setState(() {
      _currentLength = _textEditingController.text.length;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      maxLength: widget.maxLength,
      controller: _textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        counterText: '$_currentLength/${widget.maxLength}',
      ),
      buildCounter: (BuildContext context,
          {required int currentLength,
          required bool isFocused,
          required int? maxLength}) {
        return Container();
      },
    );
  }
}
