import 'package:flutter/material.dart';

class HomeButtonItem {
  final String title;
  final String routeName;
  final IconData icon;
  final int badgeNumber;

  HomeButtonItem(
      {required this.title,
      required this.routeName,
      required this.icon,
      this.badgeNumber = 0});

  HomeButtonItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        routeName = json['routeName'],
        icon = json['icon'],
        badgeNumber = json['badgeNumber'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'routeName': routeName,
        'icon': icon,
        'badgeNumber': badgeNumber,
      };
}
