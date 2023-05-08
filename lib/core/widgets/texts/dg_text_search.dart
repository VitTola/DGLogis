import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_order_parcel.dart';
import 'package:skailab_dg_logis_app/core/shared/runner.dart';

class DgTextSearch<T> extends StatefulWidget {
  const DgTextSearch({
    Key? key,
    required this.hintText,
    required this.onSearch,
    required this.onResult,
  }) : super(key: key);

  final String hintText;
  final Future<T>? Function(String) onSearch;
  final void Function(T?) onResult;

  @override
  _DgTextSearchState<T> createState() => _DgTextSearchState<T>();
}

class _DgTextSearchState<T> extends State<DgTextSearch<T>> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(236, 236, 236, 1),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: _searchById,
            icon: const Icon(
              Icons.search,
              color: AppColor.iconColor,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration.collapsed(
                hintText: widget.hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _searchById() async {
    final id = _textController.text;
    if (id.isEmpty) return;

    var result = await Runner.executeAsync<T?>(() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      return await widget.onSearch(id);
    }, context: context);

    // for testing
    result = id == 'ok'
        ? ShipmentOrderParcel(
            parcelType: 'parcelType',
            parcelWeight: 'parcelWeight',
            parcelDimension: 'parcelDimension',
            declareValue: 'declareValue',
            remarks: 'remarks',
            image: 'image') as T
        : null;
    //==============================

    widget.onResult(result);

    // clear text
    _textController.clear();
  }
}
