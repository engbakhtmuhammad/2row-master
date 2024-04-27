import 'package:flutter/material.dart';
import 'package:my_app/module/about/about.dart';
import 'package:my_app/module/download_form/download_form.dart';
import 'package:my_app/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AboutDialogPage(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
