import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:js' as js;

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16.0),
      child: LayoutBuilder(builder: (context, c) {
        var maxWidth = c.maxWidth;
        var mobileWidth = 500;
        if (maxWidth < mobileWidth) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "TWOROW",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    letterSpacing: 7,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "© 2024 TWOROW.ai",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontSize: 10,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => js.context.callMethod('open', [
                      "https://www.tiktok.com/@tworow.ai?_t=8lkWZSlYHm2&_r=1"
                    ]),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          FaIcon(FontAwesomeIcons.tiktok, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => js.context.callMethod('open', [
                      "https://www.instagram.com/tworow.ai/?igsh=MXBydm5zazRxczhzaQ%3D%3D&utm_source=qr"
                    ]),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.instagram,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => js.context.callMethod('open', [
                      "https://www.linkedin.com/company/tworow-ai/?viewAsMember=true"
                    ]),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.linkedinIn,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Row(
            children: [
              const Text(
                "© 2024 TWOROW.ai more",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => js.context.callMethod('open', [
                      "https://www.tiktok.com/@tworow.ai?_t=8lkWZSlYHm2&_r=1"
                    ]),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          FaIcon(FontAwesomeIcons.tiktok, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => js.context.callMethod('open', [
                      "https://www.instagram.com/tworow.ai/?igsh=MXBydm5zazRxczhzaQ%3D%3D&utm_source=qr"
                    ]),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.instagram,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => js.context.callMethod('open', [
                      "https://www.linkedin.com/company/tworow-ai/?viewAsMember=true"
                    ]),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.linkedinIn,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                "TWOROW",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 7,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
