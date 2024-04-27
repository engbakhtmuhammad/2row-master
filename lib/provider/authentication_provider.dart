import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/images.model.dart';
import 'package:my_app/repo/post_repository.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isRegistering = false;
  final PostRepository _postRepository = PostRepository();
  String text = '';
  List<ImagesModel> imagesModel = [
    ImagesModel(
        image: "assets/image/one.png",
        title: "Express",
        description:
            "Show up as yourself. share what you’re up to, or ask your community for local tips + tricks."),
    ImagesModel(
        image: "assets/image/two.png",
        title: "Discover",
        description:
            "Connect with your community easily with local in-app transit and micro-mobility sharing. Letting you discover the most affordable and accessible options to explore your nearby community."),
    ImagesModel(
        image: "assets/image/three.png",
        title: "Connect",
        description:
            "Connect with your community easily with local in-app transit micro-mobility sharing. Letting you discover the most affordable and accessible options"),
  ];

  List images = [
    "assets/image/1.png",
    "assets/image/2.png",
    "assets/image/3.png",
    "assets/image/4.png",
  ];

  List topProfile = [
    "assets/topprofile/1.png",
    "assets/topprofile/2.png",
    "assets/topprofile/3.png",
    "assets/topprofile/4.png",
    "assets/topprofile/5.png",
  ];
  List btmProfile = [
    "assets/topprofile/b1.png",
    "assets/topprofile/b2.png",
    "assets/topprofile/b3.png",
    "assets/topprofile/b4.png",
    "assets/topprofile/b5.png",
  ];

  List itbody = [
    "assets/indexthree/m1.png",
    "assets/indexthree/m2.png",
    "assets/indexthree/m3.png",
  ];

  List ittl = [
    "assets/indexthree/l1.png",
    "assets/indexthree/l3.png",
    "assets/indexthree/l2.png",
  ];
  List itbr = [
    "assets/indexthree/b3.png",
    "assets/indexthree/b2.png",
    "assets/indexthree/b1.png",
  ];

  void register(bool value) {
    isRegistering = value;
    notifyListeners();
  }

  bool isObscure = true;

  void obscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  resetAll() {
    isRegistering = false;
    text = "";
    isObscure = true;
    notifyListeners();
  }

  String te =
      "Welcome !\n\nThank you for registering for TWOROW.ai :)\n\nA Modern Social Network Platform Connecting Local Communities Through Conversations, and peer-to-peer sharing.\n\nStay Tuned for our official launch in your neighbourhood!\n\n\nJordan\nFounder, TWOROW.ai";

  Future<bool> postData(data, bool isEvent) async {
    try {
      bool value = await _postRepository.postData(data, isEvent);
      if (value == true) {
        text = te;
        register(false);
        notifyListeners();
        return true;
      } else {
        text = "Something went wrong!";
        register(false);
        notifyListeners();
        return false;
      }
    } catch (error) {
      text = "Something went wrong!";
      register(false);
      notifyListeners();
      return false;
    }
  }

  Future onEmailSignUp(String email, String password) async {
    try {
      register(true);
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        text = "Email has been sent to your email!";
        user.sendEmailVerification();
        notifyListeners();
        register(false);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        text = "Email has already been used!";
        register(false);
        notifyListeners();
        return false;
      } else {
        text = "Something went wrong!";
        register(false);
        notifyListeners();
        return false;
      }
    } catch (e) {
      text = "Something went wrong!";
      register(false);
      notifyListeners();
      return false;
    }
  }

  int indexForPage = 0;

  changePage(index) {
    indexForPage = index;
    notifyListeners();
  }

  bool isQrVisible = true;
  qrVisible() {
    isQrVisible = !isQrVisible;
    notifyListeners();
  }
}
