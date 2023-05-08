import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';
import 'package:skailab_dg_logis_app/core/components/send_receive_card.dart';

class SendList extends StatelessWidget {
  const SendList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: MScaffold(
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromRGBO(102, 112, 128, 0.3),
          ),
        ),
        title: "Send list",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
        bottom: const TabBar(
          isScrollable: true,
          labelColor: Color.fromRGBO(102, 112, 128, 1),
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          indicatorColor: Color.fromRGBO(102, 112, 128, 1),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Created',
            ),
            Tab(
              text: 'In-Transit',
            ),
            Tab(
              text: 'Arrived',
            ),
            Tab(
              text: 'Delivered',
            ),
            Tab(
              text: 'Cancelled',
            ),
          ],
        ),
        body: const TabBarView(children: [
          SendListItem(title: 'All'),
          SendListItem(title: 'Created'),
          SendListItem(title: 'In-Transit'),
          SendListItem(title: 'Arrived'),
          SendListItem(title: 'Delivered'),
          SendListItem(title: 'Cancelled'),
        ]),
      ),
    );
  }
}

class SendListItem extends StatelessWidget {
  final String title;
  const SendListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SendReceiveCard(status: '(In-Transit)'),
          SendReceiveCard(status: '(Created)'),
          SendReceiveCard(status: '(Delivered)'),
        ],
      ),
    );
  }
}
