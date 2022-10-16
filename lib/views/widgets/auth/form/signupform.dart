import 'package:fablab/views/widgets/auth/form/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';


import '../../../../controller/auth/signup_controller.dart';
import '../../../../core/constant/style.dart';
import '../authbutton.dart';

class AppSignUpForm extends StatelessWidget {
  const AppSignUpForm({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller =
        Get.put(SignUpControllerImp());
    return Form(
        child: Column(
      children: [
        AppCustomFormFaild(
          controller: controller.username,
          keyboardType:
              TextInputType.text,
          lable: 'full_name'.tr,
          hint: 'Enter your full name'.tr,
          icon: Ionicons.person_outline,
          obscureText: false,
        ),
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
        AppCustomFormFaild(
          controller: controller.confirmPassword,
          keyboardType:
              TextInputType.visiblePassword,
          obscureText: true,
          lable: "Confirm Password".tr,
          hint: 'Confirm your Password'.tr,
          icon: Ionicons.lock_closed_outline,
        ),
        const SizedBox(
          height: 20,
        ),
        AppCustomAuthButton(
          color: AppColor.secondry,
          text: 'signup'.tr,
          onPressed: () {
            controller.valdation();
          
          },
        ),
      ],
    ));
  }
}
