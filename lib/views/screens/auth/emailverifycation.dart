import 'package:flutter/material.dart';
import 'package:get/get.dart';

 import '../../../core/constant/style.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'verify_email'.tr,
          style: ThemeData()
              .textTheme
              .headline1!
              .copyWith(fontSize: 24),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage(
                      'assets/images/email.png')),
              Text(
                'verification link has been sent to your email'
                    .tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: AppText.light),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
