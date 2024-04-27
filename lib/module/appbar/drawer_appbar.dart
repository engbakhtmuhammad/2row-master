import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawerApppBar extends StatelessWidget {
  const CustomDrawerApppBar({
    super.key,
    required double scrollPosition,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer()),
        ),
      ],
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: const EdgeInsets.all(8.0),
          title: GestureDetector(
            onTap: () => scrollController.animateTo(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/image/white_two_row.svg",
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}
