import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/module/download_form/download_form.dart';
import 'package:my_app/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });
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
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Discover More",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 4,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Take it offline and meet other TWOROW users at our socials, talks and community.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
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
                        width: MediaQuery.of(context).size.width / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/image/tworow.svg",
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "TWOROW.ai Community Events",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "05/11 TORONTO, ON - COMMUNITY MEETUP/LAUNCH\n06/17 WINNIPEG , MB - COMMUNITY MEETUP/LAUNCH\n06/20 TORONTO, ON - COLISSION CONFERENCE MEETUP",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          _getResponsiveFontSize(context)),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                      barrierDismissible: context
                                                  .read<
                                                      AuthenticationProvider>()
                                                  .isRegistering ==
                                              false
                                          ? true
                                          : false,
                                      context: context,
                                      builder: (context) {
                                        return DownLoadForm(
                                          isEmail: true,
                                          isEvent: true,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "RESERVE A SPOT",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            _getResponsiveFontSize(context)),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text(
                "Explore",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ))
        ],
      ),
    );
  }
}
