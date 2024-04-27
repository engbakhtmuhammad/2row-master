import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutDialogPage extends StatelessWidget {
  const AboutDialogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
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
                            "Founded in Toronto, Canada TWOROW.ai is a modern social platform that provides locals in their communities a tool to connect and support their everyday journeys through local conversation and peer-to-peer sharing with each other.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: Text(
            "About",
            style: TextStyle(color: Colors.white, letterSpacing: 1.0),
          ),
        ));
  }
}
