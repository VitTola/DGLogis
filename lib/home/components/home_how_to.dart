import 'package:flutter/material.dart';

class HomeHowTo extends StatelessWidget {
  const HomeHowTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How to",
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(74, 74, 74, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              width: 252,
              height: 132,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(236, 236, 236, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/placeholder.png',
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(209, 212, 217, 1),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 16, right: 16),
                    child: const Text(
                      "How to scan the package",
                      style: TextStyle(
                          color: Color.fromRGBO(30, 30, 30, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              width: 252,
              height: 132,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(236, 236, 236, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/placeholder.png',
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(209, 212, 217, 1),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 16, right: 16),
                    child: const Text(
                      "How to receive the package",
                      style: TextStyle(
                          color: Color.fromRGBO(30, 30, 30, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              width: 252,
              height: 132,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(236, 236, 236, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/placeholder.png',
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(209, 212, 217, 1),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 16, right: 16),
                    child: const Text(
                      "How to submit dispute",
                      style: TextStyle(
                          color: Color.fromRGBO(30, 30, 30, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 252,
              height: 132,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(236, 236, 236, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/placeholder.png',
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(209, 212, 217, 1),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 16, right: 16),
                    child: const Text(
                      "How to scan QR",
                      style: TextStyle(
                          color: Color.fromRGBO(30, 30, 30, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }
}
