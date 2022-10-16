import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../widgets/auth/form/loginform.dart';
import '../../widgets/auth/text/haveacount.dart';
import '../../widgets/auth/text/signintext.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller =
        Get.put(LoginControllerImp());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/Hello.png',
              height: Get.height * .31,
            ),
            AppSiginInText(
              titel: 'Welcome Back'.tr,
              text: "Sign in to continue".tr,
            ),
            SizedBox(height: Get.height * .03),
            const AppLoginForm(),
            SizedBox(height: Get.height * .02),
            AppHaveAcountText(
              text1: "Don't have an account?".tr,
              text2: 'Sign Up'.tr,
              onTap: () {
                controller.goToSignUp();
              },
            )
          ],
        ),
      ),
    ));
  }
}
