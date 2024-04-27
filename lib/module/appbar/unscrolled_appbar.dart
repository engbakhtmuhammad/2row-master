import 'package:flutter/material.dart';
import 'package:my_app/module/about/about.dart';
import 'package:my_app/module/download_form/download_form.dart';
import 'package:my_app/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class UnScrolledAppBar extends StatelessWidget {
  const UnScrolledAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actions: [
        const AboutDialogPage(),
        GestureDetector(
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
        GestureDetector(
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
            ))
      ],
      title: const Padding(
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
    );
  }
}
