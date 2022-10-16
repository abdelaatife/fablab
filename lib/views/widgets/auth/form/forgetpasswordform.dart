import 'package:fablab/views/widgets/auth/form/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../controller/auth/fogetpassword_controller.dart';
import '../../../../core/constant/style.dart';
import '../authbutton.dart'; 
 
class AppForgetPasswordForm
    extends StatelessWidget {
  const AppForgetPasswordForm({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
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
        const SizedBox(height: 25),
        AppCustomAuthButton(
          color: AppColor.secondry,
          text: 'Verify'.tr,
          onPressed: () {
            controller.validteInputs();
          },
        ),
      ],
    ));
  }
}
