import 'package:fablab/views/screens/auth/forgetpassword/resetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
abstract class ForgetPasswordController  
    extends GetxController {
  check();
  goToverfiyCode();
  validteInputs();
}

class ForgetPasswordControllerImp
    extends ForgetPasswordController{
   late TextEditingController email;
   

  @override
  check() {}

  @override
  goToverfiyCode() {
   FirebaseAuth.instance.sendPasswordResetEmail(email: email.text).then((value) => Get.to(() => const ResetPassword()));
     Get.to(() => const ResetPassword() );
  }

  @override
  void onInit() {
     email = TextEditingController();
     super.onInit();
  }

  @override
  void dispose() {
     email.dispose();
     super.dispose();
  }
  
  @override
  validteInputs() {
    if(email.text.isEmpty){
      Get.snackbar(
        "Error".tr,
        "please fill all the fields".tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    
    } else {
      goToverfiyCode();
    }
  }
}
