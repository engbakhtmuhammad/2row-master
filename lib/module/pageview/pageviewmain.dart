import 'package:flutter/material.dart';
import 'package:my_app/module/pageview/pagecontent.dart';

class PageViewSection extends StatelessWidget {
  const PageViewSection(
      {super.key,
      required this.pageController,
      required this.scrollController});

  final PageController pageController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      child: PageContent(),
    );
  }
}
