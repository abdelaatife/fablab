import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/views/screens/auth/loggin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpController
    extends GetxController {
      FirebasePerformance performance = FirebasePerformance.instance;

  bool isEmailVerified = false;
  bool isLoading = false;

  valdation();
  goToSignIn();
  signUp();
  requetPermission();
  getToken();
}

class SignUpControllerImp
    extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController confirmPassword;
  late TextEditingController password;
  late TextEditingController code;
// firebase messaging variable
  FirebaseMessaging messaging =
      FirebaseMessaging.instance;
  late String? token;

  @override
  valdation() {
    
    if (username.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      Get.snackbar(
        "Error".tr,
        "please fill all the fields".tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (password.text.length <= 6) {
      Get.snackbar(
        "Error".tr,
        "Password must be at least 6 characters"
            .tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (password.text !=
        confirmPassword.text) {
      Get.snackbar(
        "Error".tr,
        "Password and Confirm Password does not match"
            .tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      signUp();
    }
  }

  @override
  goToSignIn() {
    Get.to(const Login());
  }

  @override
  void onInit() {
    username = TextEditingController();
    confirmPassword = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    code = TextEditingController();
    // firebas messaging token
   
    requetPermission();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    confirmPassword.dispose();
    password.dispose();
    code.dispose();
    super.dispose();
  }

  @override
  signUp() async {
      Trace   trace = performance.newTrace('signUp_trace');
      trace.start();
      trace.setMetric('signUp_metric', 1);
    isLoading = true;
    update();
    try {
      final credential = await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(
        email: email.text,
        password: confirmPassword.text,
      );
      credential.user!
          .updateDisplayName(username.text);
      FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({

        'username': username.text,
        'email': email.text,
        'token': token,
         


          });
      Get.off(const Login());
     
      Get.snackbar(
        "Success".tr,
        "Account Created Successfully Login to continue"
            .tr,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      isLoading = false;
      update();
      trace.stop();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Error".tr,
          "The password provided is too weak.".tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading = false;
        update();
      } else if (e.code ==
          'email-already-in-use') {
        Get.snackbar(
          "Error".tr,
          "The account already exists for that email."
              .tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading = false;
        update();
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          "Error".tr,
          "The email is invalid.".tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading = false;
        update();
      } else {
        Get.snackbar(
          "Error".tr,
          "Something went wrong".tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading = false;
        update();
      }
    } catch (e) {
      return e;
    }
    isLoading = false;
    update();
    trace.stop();
  }

  @override
  getToken() {
    messaging.getToken().then((value) {
      token = value;
    });
  }

  /// firebase messaging permission
  @override
  requetPermission() async {
    Trace  trace = performance.newTrace('requetPermission_trace');
      trace.start();
      trace.setMetric('requetPermission', 1);
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );                                    
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    NotificationSettings settings =
        await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      getToken();
    }  else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      getToken();
    } else {
      Get.snackbar(
        "Error".tr,
        "You must allow notification to continue"
            .tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    trace.stop();
  }
}
