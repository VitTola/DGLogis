import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/home/models/drawer_item.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<NavigationDrawer> {
  final List<DrawerItem> listItems = [
    DrawerItem("Profile", ""),
    DrawerItem("Language", ""),
    DrawerItem("Term and condition", ""),
    DrawerItem("Contact us", ""),
    DrawerItem("App Version", "")
  ];

  late int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.black,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                DrawerHeader(
                    margin: EdgeInsets.zero,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/auth/main'),
                          child: CircleAvatar(
                            radius: 48.0,
                            backgroundColor:
                                const Color.fromRGBO(217, 217, 217, 1),
                            child: Image.asset(
                              "assets/images/placeholder.png",
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Name",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Register by phone number",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    )),
                Expanded(
                    child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: listItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = listItems[index];

                    return ListTile(
                      selected: selected == index,
                      selectedTileColor: Colors.white10,
                      textColor: Colors.black,
                      title: Text(
                        listItems[index].title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () async {
                        if (index == 0) return;

                        setState(() {
                          selected = index;
                        });

                        // await pop then set seleted back to 0
                        await Navigator.pushNamed(context, item.routeName);

                        setState(() {
                          selected = 0;
                        });
                      },
                    );
                  },
                ))
              ],
            )));
  }
}
