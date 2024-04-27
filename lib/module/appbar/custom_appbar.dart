import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/module/about/about.dart';
import 'package:my_app/module/download_form/download_form.dart';
import 'package:my_app/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required double scrollPosition,
    required this.scrollController,
  }) : _scrollPosition = scrollPosition;

  final double _scrollPosition;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: true,
      actions: [
        Visibility(
            visible: _scrollPosition == 0 ? true : false,
            child: const AboutDialogPage()),
        Visibility(
          visible: _scrollPosition == 0 ? true : false,
          child: GestureDetector(
              onTap: () {
                showDialog(
                  barrierDismissible:
                      context.read<AuthenticationProvider>().isRegistering ==
                              false
                          ? true
                          : false,
                  context: context,
                  builder: (context) {
                    return DownLoadForm(
                      isEmail: true,
                      isEvent: false,
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  "Download",
                  style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                ),
              )),
        ),
        Visibility(
          visible: _scrollPosition == 0 ? true : false,
          child: GestureDetector(
              onTap: () {
                context.read<AuthenticationProvider>().resetAll();
                showDialog(
                  barrierDismissible:
                      context.read<AuthenticationProvider>().isRegistering ==
                              false
                          ? true
                          : false,
                  context: context,
                  builder: (context) {
                    return DownLoadForm(
                      isEmail: false,
                      isEvent: false,
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                ),
              )),
        )
      ],
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.all(8.0),
        title: _scrollPosition != 0
            ? GestureDetector(
                onTap: () => scrollController.animateTo(
                    //go to top of scroll
                    0, //scroll offset to go
                    duration:
                        const Duration(milliseconds: 500), //duration of scroll
                    curve: Curves.fastOutSlowIn //scroll type
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/image/white_two_row.svg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "TWO ROW",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                  ),
                ),
              ),
      ),
    );
  }
}
