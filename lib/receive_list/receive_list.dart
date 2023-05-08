import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';

import '../core/components/send_receive_card.dart';

class ReceiveList extends StatelessWidget {
  const ReceiveList({super.key});

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
        title: "Receive list",
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
        body: TabBarView(children: [
          const SendListItem(title: "All"),
          const SendListItem(title: 'Created'),
          const SendListItem(title: 'In-Transit'),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Report a problem",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/dispute-request'),
                  child: const Text(
                    "Open Dispute",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Report a problem",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Report a problem",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
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
