import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../widgets/auth/form/signupform.dart';
import '../../widgets/auth/text/haveacount.dart';
import '../../widgets/auth/text/signintext.dart'; 
class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller =
        Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'signup'.tr,
            style: ThemeData()
                .textTheme
                .headline1!
                .copyWith(fontSize: 24),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: GetBuilder<SignUpControllerImp>(
          init: controller,
          builder: (controller) {
            return  controller.isLoading == true ? const Center(child: CircularProgressIndicator()) : Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 30, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSiginInText(
                  titel:
                      "Create an account".tr,
                  text:
                      'Enter your details to create\nyour account'
                          .tr,
                ),
                const AppSignUpForm(),
                AppHaveAcountText(
                  text1:
                      'Already have an account?'
                          .tr,
                  text2: "login".tr,
                  onTap: () {
                   controller.goToSignIn();
                  
                  },
                )
              ],
            ),
          ),
        ) ;
          },
        ));
  }
}
