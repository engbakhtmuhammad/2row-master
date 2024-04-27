import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_app/provider/authentication_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import 'home/auth_service.dart';

class TestScreen extends StatefulWidget {
  TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final bool isMobile = false;
  final TextEditingController _phoneContoller = TextEditingController();
  final TextEditingController _otpContoller = TextEditingController();
  String countryCode = "+91";

  final PageController pageController = PageController();

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

  bool isPhoneAdd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Center(
              child: Visibility(
            visible: !isPhoneAdd,
            child: Container(
              color: Colors.white,
              width: 400,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Phone Number",
                      style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    IntlPhoneField(
                      showCountryFlag: false,
                      controller: _phoneContoller,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onCountryChanged: (country) {
                        countryCode = country.dialCode;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () async {
                                if (_phoneContoller.text.length == 10) {
                                  AuthService.sendOtpToUser(
                                    phone:
                                        "+$countryCode${_phoneContoller.text}",
                                    onError: () => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Error in sending OTP",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                    onSuccess: () {
                                      setState(() {
                                        isPhoneAdd = !isPhoneAdd;
                                      });
                                    },
                                  );
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
            ),
          )),
          Center(
              child: Visibility(
            visible: isPhoneAdd,
            child: Container(
              color: Colors.white,
              width: 400,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Verify Phone via OTP",
                      style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                    ),
                    Text(
                      "Code is sent to ${_phoneContoller.text}",
                      style: const TextStyle(
                          color: Colors.grey, letterSpacing: 2.0),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Pinput(
                      controller: _otpContoller,
                      length: 6,
                      defaultPinTheme: const PinTheme(
                        width: 48,
                        height: 48,
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          color: Color(0xFF93D2F3),
                        ),
                      ),
                      showCursor: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't receive the code?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6A6C7B),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isPhoneAdd = !isPhoneAdd;
                            });
                          },
                          child: const Text(
                            "Request again",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6A6C7B),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () async {
                                onPressed:
                                () {
                                  handleSubmit(context, _otpContoller.text);
                                };
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
            ),
          )),
        ],
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   body: Consumer<AuthenticationProvider>(
    //       builder: (context, value, child) => LayoutBuilder(
    //             builder: (context, constraints) {
    //               var maxWidth = constraints.maxWidth;
    //               var mobileWidth = 480;
    //               if (maxWidth < mobileWidth) {
    //                 return Column(
    //                   children: [
    //                     const SizedBox(
    //                       height: 16,
    //                     ),
    //                     Expanded(
    //                       child: Text(
    //                         "Made for meaningful\nconnection with your community",
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(
    //                             color: Colors.white,
    //                             fontSize: _getResponsiveFontSize(context),
    //                             letterSpacing: 2,
    //                             fontWeight: FontWeight.w700),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       flex: 3,
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: PageView.builder(
    //                             controller: pageController,
    //                             physics: const NeverScrollableScrollPhysics(),
    //                             itemCount: value.imagesModel.length,
    //                             scrollDirection: Axis.horizontal,
    //                             itemBuilder: (context, index) {
    //                               if (index == 0) {
    //                                 return const Wid(
    //                                   isSmallScreeen: true,
    //                                 );
    //                               }
    //                               if (index == 1) {
    //                                 return const VideoPlayerScreenTest();
    //                               } else {
    //                                 return Image.asset(
    //                                   value.imagesModel[index].image!,
    //                                   fit: BoxFit.contain,
    //                                 );
    //                               }
    //                             }),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       flex: 1,
    //                       child: Column(
    //                         children: [
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: List.generate(
    //                                 imagesModel.length,
    //                                 (index) => GestureDetector(
    //                                       onTap: () {
    //                                         value.changePage(index);
    //                                         pageController.animateToPage(index,
    //                                             duration:
    //                                                 const Duration(seconds: 1),
    //                                             curve: Curves.ease);
    //                                       },
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.all(8.0),
    //                                         child: Text(
    //                                           value.imagesModel[index].title!,
    //                                           style: TextStyle(
    //                                               color: value.indexForPage ==
    //                                                       index
    //                                                   ? Colors.green
    //                                                   : Colors.white,
    //                                               letterSpacing: 1.5,
    //                                               fontSize:
    //                                                   _getResponsiveFontSize(
    //                                                       context),
    //                                               fontWeight: FontWeight.bold),
    //                                         ),
    //                                       ),
    //                                     )),
    //                           ),
    //                           const SizedBox(
    //                             height: 12,
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Text(
    //                               value.imagesModel[value.indexForPage]
    //                                   .description!,
    //                               textAlign: TextAlign.center,
    //                               style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontSize: _getResponsiveFontSize(context),
    //                                 letterSpacing: 1.5,
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 );
    //               } else {
    //                 return Column(
    //                   children: [
    //                     const SizedBox(
    //                       height: 20,
    //                     ),
    //                     const Text(
    //                       "Made for meaningful\nconnection with your community",
    //                       textAlign: TextAlign.center,
    //                       style: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 22,
    //                           letterSpacing: 2,
    //                           fontWeight: FontWeight.w700),
    //                     ),
    //                     const SizedBox(
    //                       height: 20,
    //                     ),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                       children: [
    //                         const Expanded(
    //                           flex: 1,
    //                           child: SizedBox(),
    //                         ),
    //                         Expanded(
    //                           flex: 1,
    //                           child: SizedBox(
    //                             height:
    //                                 MediaQuery.of(context).size.height / 1.5,
    //                             width: MediaQuery.of(context).size.width / 2,
    //                             child: Padding(
    //                               padding: const EdgeInsets.all(8.0),
    //                               child: PageView.builder(
    //                                   controller: pageController,
    //                                   physics:
    //                                       const NeverScrollableScrollPhysics(),
    //                                   itemCount: value.imagesModel.length,
    //                                   scrollDirection: Axis.horizontal,
    //                                   itemBuilder: (context, index) {
    //                                     if (index == 0) {
    //                                       return const VideoPlayerScreenTest();
    //                                     } else {
    //                                       return Image.asset(
    //                                         value.imagesModel[index].image!,
    //                                         fit: BoxFit.contain,
    //                                       );
    //                                     }
    //                                   }),
    //                             ),
    //                           ),
    //                         ),
    //                         Expanded(
    //                           flex: 1,
    //                           child: SizedBox(
    //                               // height: MediaQuery.of(context).size.height,
    //                               // width: MediaQuery.of(context).size.width / 2,
    //                               child: Column(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             children: [
    //                               Row(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: List.generate(
    //                                     imagesModel.length,
    //                                     (index) => GestureDetector(
    //                                           onTap: () {
    //                                             value.changePage(index);
    //                                             pageController.animateToPage(
    //                                                 index,
    //                                                 duration: const Duration(
    //                                                     seconds: 1),
    //                                                 curve: Curves.ease);
    //                                           },
    //                                           child: Padding(
    //                                             padding:
    //                                                 const EdgeInsets.all(8.0),
    //                                             child: Text(
    //                                               value.imagesModel[index]
    //                                                   .title!,
    //                                               style: TextStyle(
    //                                                   color:
    //                                                       value.indexForPage ==
    //                                                               index
    //                                                           ? Colors.green
    //                                                           : Colors.white,
    //                                                   letterSpacing: 1.5,
    //                                                   fontSize:
    //                                                       _getResponsiveFontSize(
    //                                                           context),
    //                                                   fontWeight:
    //                                                       FontWeight.bold),
    //                                             ),
    //                                           ),
    //                                         )),
    //                               ),
    //                               Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: Text(
    //                                   value.imagesModel[value.indexForPage]
    //                                       .description!,
    //                                   textAlign: TextAlign.center,
    //                                   style: const TextStyle(
    //                                     color: Colors.white,
    //                                     letterSpacing: 1.5,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           )),
    //                         ),
    //                         const SizedBox(),
    //                       ],
    //                     ),
    //                   ],
    //                 );
    //               }
    //             },
    //           )),
    // );
  }

  void handleSubmit(BuildContext context, String otp) {
    if (otp.length == 6) {
      AuthService.loginWithOtp(otp: otp).then((value) {
        if (value == "Success") {
          print("Verified OTP");
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      });
    }
  }
}

class Wid extends StatelessWidget {
  const Wid({
    super.key,
    required this.isSmallScreeen,
  });
  final bool isSmallScreeen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CarouselSlider.builder(
                  itemCount:
                      context.read<AuthenticationProvider>().images.length,
                  itemBuilder: (context, index, realIndex) => Image.asset(
                        context.read<AuthenticationProvider>().images[index],
                        fit: BoxFit.fitHeight,
                      ),
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      scrollDirection: Axis.vertical)),
            )),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: isSmallScreeen
              ? Image.asset(
                  "assets/image/fone.png",
                  // fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height / 4,
                )
              : Image.asset(
                  "assets/image/fone.png",
                  fit: BoxFit.fitHeight,
                ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 100.0,
            width: 200.0,
            margin: const EdgeInsets.only(left: 250.0, top: 60.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: CarouselSlider.builder(
              itemCount:
                  context.read<AuthenticationProvider>().topProfile.length,
              itemBuilder: (context, index, realIndex) => Image.asset(
                context.read<AuthenticationProvider>().topProfile[index],
                fit: BoxFit.fitHeight,
              ),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                height: 100.0,
                viewportFraction: 1,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(right: 200.0, bottom: 40.0),
            height: 150.0,
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: CarouselSlider.builder(
              itemCount:
                  context.read<AuthenticationProvider>().btmProfile.length,
              itemBuilder: (context, index, realIndex) => Image.asset(
                context.read<AuthenticationProvider>().btmProfile[index],
                fit: BoxFit.fitHeight,
              ),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VideoPlayerScreenTest extends StatefulWidget {
  const VideoPlayerScreenTest({super.key});

  @override
  State<VideoPlayerScreenTest> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreenTest> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/mid.mp4',
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
