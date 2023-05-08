import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/dispute/components/dispute_card.dart';
import 'package:skailab_dg_logis_app/core/components/m_scaffold.dart';

import '../core/consts/app_color.dart';

class DisputeList extends StatelessWidget {
  const DisputeList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: MScaffold(
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromRGBO(102, 112, 128, 0.3),
          ),
        ),
        title: "Dispute list",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
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
              text: 'Requested',
            ),
            Tab(
              text: 'Processing',
            ),
            Tab(
              text: 'Resolved',
            ),
            Tab(
              text: 'Rejected',
            ),
          ],
        ),
        body: const TabBarView(children: [
          DisputeListItem(title: "All"),
          DisputeListItem(title: 'Requested'),
          DisputeListItem(title: 'Processing'),
          DisputeListItem(title: 'Resolved'),
          DisputeListItem(title: 'Rejected'),
        ]),
      ),
    );
  }
}

class DisputeListItem extends StatelessWidget {
  final String title;

  const DisputeListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DisputeCard(
            status: 'Requested',
            statusColor: AppColor.boldGrey,
          ),
          DisputeCard(
            status: 'Processing',
            statusColor: AppColor.boldYellow,
          ),
          DisputeCard(
            status: 'Resolved',
            statusColor: AppColor.boldGreen,
          ),
          DisputeCard(
            status: 'Rejected',
            statusColor: AppColor.boldRed,
          ),
        ],
      ),
    );
  }
}
