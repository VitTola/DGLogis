import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/search_by_tracking_id/search_screen.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(236, 236, 236, 1),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchScreen.routeName,
                      arguments: {'searchText': textController.text});
                },
                icon: const Icon(Icons.search)),
            Expanded(
              child: TextField(
                controller: textController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Searching tracking ID',
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.crop_free),
            )
          ],
        ));
  }
}
