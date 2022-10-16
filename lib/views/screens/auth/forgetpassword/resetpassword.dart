import 'package:fablab/core/constant/style.dart';
import 'package:fablab/views/widgets/auth/authbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../loggin.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Reset Password".tr,
            style: ThemeData()
                .textTheme
                .headline1!
                .copyWith(fontSize: 24),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Done.png',
                    height: Get.height * .38,
                  ),
                  Text(
                      "We have sent you an email with a link to reset your password"
                          .tr,
                      textAlign: TextAlign.center,
                      style: ThemeData()
                          .textTheme
                          .bodyText1!
                          .copyWith(
                            fontSize: 16,
                          )),

                          AppCustomAuthButton(text: 'Login', onPressed:  (() {
                            Get.offAll(() => const  Login());
                          }), color: AppColor.secondry)
                ],
              ),
            ),
          ),
        ));
  }
}
