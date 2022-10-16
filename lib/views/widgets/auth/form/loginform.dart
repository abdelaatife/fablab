import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../controller/auth/login_controller.dart';
import '../../../../core/constant/style.dart';
import '../authbutton.dart';
import '../text/foggetpassword.dart';
import 'customformfield.dart'; 

class AppLoginForm extends StatelessWidget {
  const AppLoginForm({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller =
        Get.put(LoginControllerImp());
    return Form(
        child: Column(
      children: [
        AppCustomFormFaild(
          controller: controller.email,
          keyboardType:
              TextInputType.emailAddress,
          lable: 'Email'.tr,
          hint: 'Enter your email'.tr,
          icon: Ionicons.mail_outline,
          obscureText: false,
        ),
        AppCustomFormFaild(
          controller: controller.password,
          keyboardType:
              TextInputType.visiblePassword,
          obscureText: true,
          lable: 'Password'.tr,
          hint: 'Enter your Password'.tr,
          icon: Ionicons.lock_closed_outline,
        ),
        const AppForgetPasswordText(),
        AppCustomAuthButton(
          color: AppColor.secondry,
          text: 'Submit'.tr,
          onPressed: () {
            controller.validteInputs();
          
          },
        ),
      ],
    ));
  }
}
