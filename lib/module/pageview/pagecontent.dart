import 'package:flutter/material.dart';
import 'package:my_app/model/images.model.dart';
import 'package:my_app/module/pageview/widget/pageslider.dart';
import 'package:my_app/module/pageview/widget/video_section.dart';
import 'package:my_app/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class PageContent extends StatelessWidget {
  PageContent({super.key});

  final bool isMobile = false;
  final PageController pageController = PageController();

  double _getResponsiveFontSize(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
    return Consumer<AuthenticationProvider>(
        builder: (context, value, child) => LayoutBuilder(
              builder: (context, constraints) {
                var maxWidth = constraints.maxWidth;
                var mobileWidth = 800;
                if (maxWidth < mobileWidth) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Text(
                          "Made for meaningful\nconnection with your community",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _getResponsiveFontSize(context),
                              letterSpacing: 2,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PageView.builder(
                              controller: pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: value.imagesModel.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final imageP =
                                    context.read<AuthenticationProvider>();
                                if (index == 0) {
                                  return Wid(
                                    isIT: false,
                                    isSmallScreeen: true,
                                    btmLeft: imageP.btmProfile,
                                    topRight: imageP.topProfile,
                                    mainImages: imageP.images,
                                  );
                                }
                                if (index == 1) {
                                  return const VideoSectionMid();
                                }
                                if (index == 2) {
                                  return Wid(
                                    isIT: true,
                                    isSmallScreeen: true,
                                    btmLeft: imageP.itbr,
                                    topRight: imageP.ittl,
                                    mainImages: imageP.itbody,
                                  );
                                } else {
                                  return Image.asset(
                                    value.imagesModel[index].image!,
                                    fit: BoxFit.contain,
                                  );
                                }
                              }),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  imagesModel.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          value.changePage(index);
                                          pageController.animateToPage(index,
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.ease);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            value.imagesModel[index].title!,
                                            style: TextStyle(
                                                color:
                                                    value.indexForPage == index
                                                        ? Colors.green
                                                        : Colors.white,
                                                letterSpacing: 1.5,
                                                fontSize:
                                                    _getResponsiveFontSize(
                                                        context),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value.imagesModel[value.indexForPage]
                                    .description!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _getResponsiveFontSize(context),
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Made for meaningful\nconnection with your community",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Visibility(
                              visible: maxWidth < 1100 ? false : true,
                              child:
                                  const Expanded(flex: 1, child: SizedBox())),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 1.5,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: PageView.builder(
                                    controller: pageController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: value.imagesModel.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final imageP = context
                                          .read<AuthenticationProvider>();
                                      if (index == 0) {
                                        return Wid(
                                          isIT: false,
                                          isSmallScreeen: true,
                                          btmLeft: imageP.btmProfile,
                                          topRight: imageP.topProfile,
                                          mainImages: imageP.images,
                                        );
                                      }
                                      if (index == 1) {
                                        return const VideoSectionMid();
                                      }
                                      if (index == 2) {
                                        return Wid(
                                          isIT: true,
                                          isSmallScreeen: true,
                                          btmLeft: imageP.itbr,
                                          topRight: imageP.ittl,
                                          mainImages: imageP.itbody,
                                        );
                                      } else {
                                        return Image.asset(
                                          value.imagesModel[index].image!,
                                          fit: BoxFit.contain,
                                        );
                                      }
                                    }),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: SizedBox(
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
                                                pageController.animateToPage(
                                                    index,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.ease);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  value.imagesModel[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color:
                                                          value.indexForPage ==
                                                                  index
                                                              ? Colors.green
                                                              : Colors.white,
                                                      letterSpacing: 1.5,
                                                      fontSize:
                                                          _getResponsiveFontSize(
                                                              context),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value.imagesModel[value.indexForPage]
                                          .description!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ],
                  );
                }
              },
            ));
  }
}
