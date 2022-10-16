import 'package:fablab/views/screens/auth/loggin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/style.dart';
import '../../../widgets/auth/authbutton.dart'; 
class SuccessPasswordChanget
    extends StatelessWidget {
  const SuccessPasswordChanget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage(
                      'assets/images/Done.png')),
              Text(
              'Password Changed Successfully'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: AppText.light),
              ),
              const SizedBox(height: 25),
              AppCustomAuthButton(
                color: AppColor.secondry,
                text:  "Sign In".tr,
                onPressed: () {
                  Get.offAll( const Login());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
