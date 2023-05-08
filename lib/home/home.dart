import 'package:badges/badges.dart' as mbadge;
import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/home/components/home_carousel.dart';
import 'package:skailab_dg_logis_app/home/components/home_buttons.dart';
import 'package:skailab_dg_logis_app/home/components/home_how_to.dart';
import 'package:skailab_dg_logis_app/home/components/home_search.dart';
import 'package:skailab_dg_logis_app/home/components/navigation_drawer.dart'
    as mdrawer;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
          ),
          title: const Text(
            "Logo",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => {},
                icon: const mbadge.Badge(
                  badgeContent: Text(
                    "9",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(Icons.notifications_none, color: Colors.black),
                ))
          ],
        ),
        drawer: const mdrawer.NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(),
              child: Column(children: const [
                HomeSearch(),
                SizedBox(
                  height: 16,
                ),
                HomeButtons(),
                SizedBox(
                  height: 16,
                ),
                HomeCarousel(),
                SizedBox(
                  height: 24,
                ),
                HomeHowTo()
              ])),
        ));
  }
}
