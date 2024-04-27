import 'package:flutter/material.dart';
import 'package:my_app/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class Segment extends StatelessWidget {
  const Segment({
    super.key,
    required this.isEmail,
    required this.validator,
    required this.isFirstPage,
    required this.isLastPage,
    required this.formKey,
    required this.isEvent,
    required this.controller,
    required TextEditingController nameTextEditingController,
    required TextEditingController zipTextEditingController,
    required TextEditingController valueTextEditingController,
    required PageController pageController,
    required this.title,
    required this.hintText,
  })  : _nameTextEditingController = nameTextEditingController,
        _zipTextEditingController = zipTextEditingController,
        _valueTextEditingController = valueTextEditingController,
        _pageController = pageController;

  final TextEditingController _nameTextEditingController;
  final TextEditingController _zipTextEditingController;
  final TextEditingController _valueTextEditingController;

  final PageController _pageController;
  final String title;
  final bool isEmail;
  final TextEditingController controller;

  final String hintText;
  final String? Function(String?)? validator;
  final bool isFirstPage;
  final bool isLastPage;
  final GlobalKey<FormState> formKey;

  final bool isEvent;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.black, letterSpacing: 2.0),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
                cursorColor: Colors.black,
                controller: controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(color: Colors.black),
                validator: validator,
                decoration: InputDecoration(
                  focusColor: Colors.transparent,
                  hintText: hintText,
                  hintStyle:
                      const TextStyle(color: Colors.grey, letterSpacing: 1.0),
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hoverColor: Colors.black,
                )),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: isFirstPage
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: isFirstPage ? false : true,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                        onPressed: () {
                          if (_pageController.page == 0) {
                          } else {
                            // if (formKey.currentState!.validate()) {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeIn);
                            // }
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Colors.black,
                          size: 40,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () async {
                        if (_pageController.page == 2) {
                          if (formKey.currentState!.validate()) {
                            var data = {
                              'area': _zipTextEditingController.text,
                              'format': _valueTextEditingController.text,
                              'name': _nameTextEditingController.text,
                              'isEmail': isEmail,
                              'createdAt': DateTime.now()
                            };
                            //Authenticator to add
                            final ap = context.read<AuthenticationProvider>();
                            bool f = await ap.postData(data, isEvent);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      f ? "Registration successful!" : ap.text),
                                ),
                              );
                            }
                          }
                        } else {
                          if (formKey.currentState!.validate()) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeIn);
                          }
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.black,
                        size: 40,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
