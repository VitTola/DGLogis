class DrawerItem {
  final String title;
  final String routeName;

  DrawerItem(this.title, this.routeName);

  DrawerItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        routeName = json['routeName'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'routeName': routeName,
      };
}
