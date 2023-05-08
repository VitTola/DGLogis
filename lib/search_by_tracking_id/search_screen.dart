import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/shipment_card.dart';
import 'package:skailab_dg_logis_app/core/consts/app_color.dart';
import 'package:skailab_dg_logis_app/core/dialogs/not_found_dialog.dart';
import 'package:skailab_dg_logis_app/core/models/shipment_order_parcel.dart';
import 'package:skailab_dg_logis_app/core/widgets/buttons/dg_button.dart';
import 'package:skailab_dg_logis_app/core/widgets/dg_future_builder.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text.dart';
import 'package:skailab_dg_logis_app/core/widgets/texts/dg_text_search.dart';
import 'package:skailab_dg_logis_app/scan_qr/qr_screen.dart';
import 'package:skailab_dg_logis_app/scan_qr/shipment_details_screen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  dynamic _searchResult;
  bool _isSearchFromOutside = false;
  String _searchId = '';

  // temporary auth
  final bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//check if passing value to search from outside or not
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    _searchId = arguments['searchText'] ?? '';

    if (arguments.isNotEmpty) {
      _isSearchFromOutside = true;
    }

    return DGFutureBuilder<ShipmentOrderParcel?>(
      futureFn: () async {
        if (_isSearchFromOutside) {
          await Future.delayed(const Duration(milliseconds: 1000));
          var res = await _searchById(_searchId);

          // for testing================
          res = _searchId == 'ok'
              ? ShipmentOrderParcel(
                  parcelType: 'parcelType',
                  parcelWeight: 'parcelWeight',
                  parcelDimension: 'parcelDimension',
                  declareValue: 'declareValue',
                  remarks: 'remarks',
                  image: 'image')
              : null;
          //==============================

          _handleSearchResult(res);
          return res;
        }
        return null;
      },
      builder: (context, data) => Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.iconColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          title: Row(
            children: [
              Expanded(
                flex: 5,
                child: DgTextSearch<ShipmentOrderParcel>(
                  hintText: 'Search by tracking ID',
                  onSearch: _searchById,
                  onResult: _handleSearchResult,
                ),
              ),
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(236, 236, 236, 1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.crop_free,
                    color: AppColor.iconColor,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, QRScreen.routeName);
                  },
                ),
              )
            ],
          ),

          // centerTitle: true,
        ),
        body: _isSearchFromOutside ? _bodyResult(context) : _emptyWidget(),
      ),
    );
  }

  void _shipmentOnTap() {
    if (_searchResult == null) return;
    if (!_isAuthenticated) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              width: 180,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/image_placeholder.png',
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 16),
                    const DgText(
                      'Login Required',
                      type: DgTextType.title,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const DgText(
                      'You are required to login to see this shipment details',
                      type: DgTextType.body,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    DGButton(
                      variant: ButtonVariant.elevated,
                      Row(
                        children: const [
                          Expanded(
                            child: DgText(
                              'Login',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // handle login button click
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      return;
    }

    Navigator.pushNamed(context, ShipmentDetailScreen.routeName);
  }

  void _handleSearchResult(dynamic result) {
    setState(() {
      _searchResult = result;
    });
  }

  Widget _bodyResult(BuildContext context) {
    if (_searchResult != null) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            children: [
              ShipmentCard(
                onTap: _shipmentOnTap,
              ),
              const SizedBox()
            ],
          ));
    } else {
      return const NotFoundDialog();
    }
  }

  Future<ShipmentOrderParcel>? _searchById(String p1) {
    return null;
  }

  Widget _emptyWidget() {
    _isSearchFromOutside = true;
    return const SizedBox.shrink();
  }
}
