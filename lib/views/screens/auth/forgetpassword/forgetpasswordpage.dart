import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/auth/form/forgetpasswordform.dart';
import '../../../widgets/auth/text/signintext.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
             
              children: [
                  SizedBox(
                  height: Get.height * 0.12,
                ),
                AppSiginInText(
                  titel: 'Forget Password'.tr,
                  text:
                      'Enter your email to reset\nyour password'
                          .tr,
                ),
                 SizedBox(
                  height: Get.height * 0.02,
                ),
                Image.asset(
                    'assets/images/Reset password.png'),
                const AppForgetPasswordForm(),
              ],
            ),
          ),
        ));
  }
}
