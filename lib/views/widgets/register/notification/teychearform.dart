import 'package:fablab/controller/register/tetcherform_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../custombutton.dart';
import '../pickefile.dart';
import '../textform.dart';

class AppTetchearForm extends StatelessWidget {
  final Color color;
  const AppTetchearForm(
      {Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TetchearFormControllerImpl
        tetchearFormControllerImpl =
        Get.put(TetchearFormControllerImpl());
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Registration Form',
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppCustomForm(
              hintText: 'Enter your full name',
              titleText: 'Full Name',
              controller:
                  tetchearFormControllerImpl
                      .fullnameController,
              icon: Ionicons.person_outline,
            ),
            AppCustomForm(
                hintText:
                    'Enter your Email',
                    
                icon: Ionicons.card_outline,
                keyboardType: TextInputType.emailAddress,
                controller:
                    tetchearFormControllerImpl
                        .emailController,
                titleText: 'Email Address'),
            AppCustomForm(
                hintText:
                    'Enter your Specialization',
                icon: Ionicons.call_outline,
                controller:
                    tetchearFormControllerImpl
                        .sepiclizationController,
                keyboardType: TextInputType.text,
                titleText: 'Specialization'),

            // DROPDOWN BUTTON

            AppCustomForm(
                hintText:
                    'Enter your office number',
                icon: Ionicons.person_add_outline,
                controller:
                    tetchearFormControllerImpl
                        .officenumberController,
                titleText: 'Office Number'),

            const AppPickFile(
              label: 'Upload your photo',
            
            ),

            const SizedBox(
              height: 20,
            ),

            AppCustomButton(
              label: 'Submit',
              onTap: () {
                tetchearFormControllerImpl
                    .validtor();
              },
              color: color,
            )
          ],
        ),
      ),
    ));
  }
}
