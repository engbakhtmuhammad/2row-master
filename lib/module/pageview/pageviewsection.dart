import 'package:flutter/material.dart';
import 'package:my_app/model/images.model.dart';
import 'package:my_app/provider/authentication_provider.dart';

class PageViewSectionWidget extends StatelessWidget {
  const PageViewSectionWidget(
      {super.key,
      required this.pageController,
      required this.value,
      required this.isMobile});

  final PageController pageController;
  final AuthenticationProvider value;
  final bool isMobile;

  double _getResponsiveFontSize(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Define breakpoints for different device categories
    if (screenWidth <= 500) {
      return 10.0;
    } else if (screenWidth <= 800) {
      return 10.0;
    } else {
      return 16.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isMobile
          ? MediaQuery.of(context).size.height * 0.65
          : MediaQuery.of(context).size.height / 1.5,
      width: isMobile
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 1.5,
      child: isMobile
          ? Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          imagesModel.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  value.changePage(index);
                                  pageController.animateToPage(index,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.ease);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    value.imagesModel[index].title!,
                                    style: TextStyle(
                                        color: value.indexForPage == index
                                            ? Colors.green
                                            : Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value.imagesModel[value.indexForPage].description!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView.builder(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.imagesModel.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          value.imagesModel[index].image!,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                const SizedBox(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView.builder(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.imagesModel.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            value.imagesModel[index].image!,
                            fit: BoxFit.contain,
                          );
                        }),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          imagesModel.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  value.changePage(index);
                                  pageController.animateToPage(index,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.ease);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    value.imagesModel[index].title!,
                                    style: TextStyle(
                                        color: value.indexForPage == index
                                            ? Colors.green
                                            : Colors.white,
                                        letterSpacing: 1.5,
                                        fontSize:
                                            _getResponsiveFontSize(context),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value.imagesModel[value.indexForPage].description!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
    );
  }
}
