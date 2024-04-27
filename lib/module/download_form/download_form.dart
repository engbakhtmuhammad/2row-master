import 'package:flutter/material.dart';
import 'package:my_app/module/download_form/widget/dowloadSegment.dart';
import 'package:my_app/provider/authentication_provider.dart';
import 'package:my_app/utils/validators.utils.dart';
import 'package:provider/provider.dart';

class DownLoadForm extends StatelessWidget {
  final bool isEmail;
  DownLoadForm({super.key, required this.isEmail, required this.isEvent});
  final TextEditingController _valueTextEditingControlelr =
      TextEditingController();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _zipTextEditingController =
      TextEditingController();

  final formkey = GlobalKey<FormState>();
  final ValidatorUtils _validatorUtils = ValidatorUtils();
  final PageController _pageController = PageController();
  final bool isEvent;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      insetAnimationDuration: const Duration(milliseconds: 100),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Form(
        key: formkey,
        child: Consumer<AuthenticationProvider>(
          builder: (context, ap, child) => ap.text != ""
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.height / 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ap.text,
                        style: const TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.0,
                            fontSize: 12),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height / 2.7,
                  width: MediaQuery.of(context).size.height / 2,
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Segment(
                          isEmail: isEmail,
                          formKey: formkey,
                          isFirstPage: true,
                          isEvent: isEvent,
                          isLastPage: false,
                          validator: (p0) => _validatorUtils.validateName(p0),
                          title: "WHATS YOUR NAME ?",
                          hintText: "AUBERY GRAHAM",
                          controller: _nameTextEditingController,
                          valueTextEditingController:
                              _valueTextEditingControlelr,
                          zipTextEditingController: _zipTextEditingController,
                          nameTextEditingController: _nameTextEditingController,
                          pageController: _pageController),
                      Segment(
                          isEvent: isEvent,
                          isEmail: isEmail,
                          isFirstPage: false,
                          isLastPage: false,
                          formKey: formkey,
                          title: "YOUR HOME COMMUNITY ?",
                          validator: (p0) => _validatorUtils.validateZip(p0),
                          hintText: "M5V 3J6",
                          controller: _zipTextEditingController,
                          valueTextEditingController:
                              _valueTextEditingControlelr,
                          zipTextEditingController: _zipTextEditingController,
                          nameTextEditingController: _nameTextEditingController,
                          pageController: _pageController),
                      Segment(
                          isEmail: isEmail,
                          isEvent: isEvent,
                          isFirstPage: false,
                          isLastPage: true,
                          formKey: formkey,
                          validator: (p0) => isEmail
                              ? _validatorUtils.validateEmail(p0)
                              : _validatorUtils.validateMobileNumber(p0),
                          title: isEmail
                              ? "REGISTER VIA EMAIL"
                              : "DOWNLOAD VIA SMS",
                          hintText:
                              isEmail ? "AUBREY@TWOROW.AI" : "+ 1 000 000 000",
                          controller: _valueTextEditingControlelr,
                          valueTextEditingController:
                              _valueTextEditingControlelr,
                          zipTextEditingController: _zipTextEditingController,
                          nameTextEditingController: _nameTextEditingController,
                          pageController: _pageController),
                    ],
                  )),
        ),
      ),
    );
  }
}
