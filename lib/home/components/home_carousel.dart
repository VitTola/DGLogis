import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(236, 236, 236, 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ImageSlideshow(
        autoPlayInterval: 2000,
        isLoop: true,
        width: double.infinity,
        height: 162,
        indicatorBackgroundColor: const Color.fromRGBO(143, 140, 134, 1),
        indicatorColor: const Color.fromRGBO(96, 96, 96, 1),
        initialPage: 0,
        children: [
          Image.asset(
            'assets/images/placeholder.png',
          ),
          Image.asset(
            'assets/images/placeholder.png',
          ),
          Image.asset(
            'assets/images/placeholder.png',
          ),
          Image.asset(
            'assets/images/placeholder.png',
          ),
          Image.asset(
            'assets/images/placeholder.png',
          ),
        ],
      ),
    );
  }
}
