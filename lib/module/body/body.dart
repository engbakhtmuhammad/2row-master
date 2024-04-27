import 'package:flutter/material.dart';
import 'package:my_app/module/appbar/custom_appbar.dart';
import 'package:my_app/module/appbar/drawer_appbar.dart';

import 'package:my_app/module/drawer/drawer.dart';
import 'package:my_app/module/events/events.dart';
import 'package:my_app/module/footer/footer.dart';
import 'package:my_app/module/pageview/pageviewmain.dart';
import 'package:my_app/module/videoplayer/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();

  final ScrollController _scrollController = ScrollController();
  final ScrollController _listScrollController = ScrollController();

  double _scrollPosition = 0;
  bool isAtEnd = false;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      _scrollController.position.atEdge ? isAtEnd = false : isAtEnd = true;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _listScrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: const EndDrawerWidget(),
      endDrawerEnableOpenDragGesture: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Visibility(
        visible: isAtEnd,
        child: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: Colors.black,
            onPressed: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return Dialog(
                    surfaceTintColor: Colors.white,
                    backgroundColor: Colors.white,
                    insetAnimationDuration: const Duration(milliseconds: 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.height / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Scan to Download the \n TwoRow app",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Image.asset(
                              'assets/image/qrOne.png',
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.height / 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Icons.qr_code,
              color: Colors.white,
            )),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              var maxHeight = 480;
              var width = MediaQuery.of(context).size.width;
              if (width > maxHeight) {
                return CustomAppBar(
                  scrollPosition: _scrollPosition,
                  scrollController: _scrollController,
                );
              } else {
                return CustomDrawerApppBar(
                  scrollPosition: _scrollPosition,
                  scrollController: _scrollController,
                );
              }
            },
          ),
          const SliverToBoxAdapter(child: VideoPlayerScreen()),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 64,
            ),
          ),
          SliverToBoxAdapter(
            child: PageViewSection(
              pageController: pageController,
              scrollController: _listScrollController,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          const SliverToBoxAdapter(child: BottomWidget()),
          const SliverToBoxAdapter(child: Footer())
        ],
      ),
    );
  }
}
