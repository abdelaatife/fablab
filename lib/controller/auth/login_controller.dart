import 'package:fablab/views/screens/auth/signup.dart';
import 'package:fablab/views/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController
    extends GetxController {
  FirebasePerformance performance =
      FirebasePerformance.instance;

 

  login();
  goToSignUp();
  goToForgetPassword();
  validteInputs();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  login() async {
     Trace trace =
     performance.newTrace('login_trace');
      trace.start();
      trace.setMetric('login_metric', 1);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text,
              password: password.text);

      Get.offAll(const Dashboard());
      trace.stop();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error".tr,
          "No user found for that email.".tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error".tr,
          "Wrong password provided for that user."
              .tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          "Error".tr,
          "Invalid Email".tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      trace.stop();
    }
  }

  @override
  goToSignUp() {
    Get.to(() => const Signup(),
        transition:
            Transition.rightToLeftWithFade,
        duration:
            const Duration(milliseconds: 400),
        curve: Curves.easeIn);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    // Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  validteInputs() {
    if (email.text.isEmpty ||
        password.text.isEmpty) {
      Get.snackbar(
        "Error".tr,
        "please fill all the fields".tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      login();
    }
  }
}
