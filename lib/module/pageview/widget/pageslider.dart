import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Wid extends StatelessWidget {
  const Wid(
      {super.key,
      required this.isSmallScreeen,
      required this.mainImages,
      required this.isIT,
      required this.btmLeft,
      required this.topRight});
  final bool isSmallScreeen;
  final bool isIT;

  final List<dynamic> mainImages;
  final List<dynamic> btmLeft;
  final List<dynamic> topRight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CarouselSlider.builder(
                  itemCount: mainImages.length,
                  itemBuilder: (context, index, realIndex) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            mainImages[index],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                  options: CarouselOptions(
                      autoPlay: true,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      scrollDirection: Axis.vertical)),
            )),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: isSmallScreeen
              ? Image.asset(
                  "assets/image/fone.png",
                  // fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height / 4,
                )
              : Image.asset(
                  "assets/image/fone.png",
                  fit: BoxFit.fitHeight,
                ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 120.0,
            height: 120,
            margin: const EdgeInsets.only(left: 250.0, top: 60.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: CarouselSlider.builder(
              itemCount: topRight.length,
              itemBuilder: (context, index, realIndex) => Image.asset(
                topRight[index],
                fit: BoxFit.contain,
              ),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                viewportFraction: 1,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(right: 200.0, bottom: 40.0),
            width: 200.0,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 245, 244, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CarouselSlider.builder(
              itemCount: btmLeft.length,
              itemBuilder: (context, index, realIndex) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  btmLeft[index],
                  width: 200.0,
                  height: 100,
                  fit: isIT ? BoxFit.contain : BoxFit.cover,
                ),
              ),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
