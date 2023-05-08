import 'package:badges/badges.dart' as mbadge;
import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/home/models/home_button_item.dart';
import 'package:skailab_dg_logis_app/scan_qr/qr_screen.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 16,
      runSpacing: 16,
      children: [
        HomeButton(
          buttonItem: HomeButtonItem(
            title: "Send list",
            icon: Icons.backup_table_outlined,
            routeName: "/send-list",
            badgeNumber: 2,
          ),
        ),
        HomeButton(
          buttonItem: HomeButtonItem(
            title: "Receive list",
            icon: Icons.backup_table_rounded,
            routeName: "/receive-list",
            badgeNumber: 1,
          ),
        ),
        HomeButton(
          buttonItem: HomeButtonItem(
            title: "Dispute",
            icon: Icons.people_outline,
            routeName: "/dispute-list",
            badgeNumber: 2,
          ),
        ),
        HomeButton(
          buttonItem: HomeButtonItem(
            title: "Scan QR",
            icon: Icons.qr_code_scanner_outlined,
            routeName: QRScreen.routeName,
          ),
        )
      ],
    );
  }
}

class HomeButton extends StatelessWidget {
  final HomeButtonItem buttonItem;
  const HomeButton({Key? key, required this.buttonItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey,
        backgroundColor: const Color.fromRGBO(236, 236, 236, 1),
        padding: const EdgeInsets.only(left: 0, right: 0),
      ),
      onPressed: () => Navigator.of(context).pushNamed(buttonItem.routeName),
      child: mbadge.Badge(
        position: mbadge.BadgePosition.topEnd(end: 8, top: 4),
        badgeStyle: const mbadge.BadgeStyle(
          badgeColor: Color.fromRGBO(217, 217, 217, 1),
          padding: EdgeInsets.all(8),
        ),
        showBadge: buttonItem.badgeNumber > 0,
        badgeContent: Text(
          "${buttonItem.badgeNumber}",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 24,
          padding: const EdgeInsets.only(top: 32, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                buttonItem.icon,
                size: 48,
                color: Colors.black,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                buttonItem.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
