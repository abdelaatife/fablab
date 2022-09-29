//this is the student form widget
// in this widget there is list of form fields

import 'package:fablab/controller/studentform_controller.dart';
import 'package:fablab/views/widgets/custombutton.dart';
import 'package:fablab/views/widgets/dropdownmanu.dart';
import 'package:fablab/views/widgets/pickefile.dart';
import 'package:fablab/views/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class AppStudentForm extends StatelessWidget {
  final Color color;
  const AppStudentForm(
      {Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentFormControllerImpl
        studentFormControllerImpl =
        Get.put(StudentFormControllerImpl());
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
                  studentFormControllerImpl
                      .fullnameController,
              icon: Ionicons.person_outline,
            ),
            AppCustomForm(
                hintText:
                    'Enter your card number',
                icon: Ionicons.card_outline,
                keyboardType: TextInputType.phone,
                controller:
                    studentFormControllerImpl
                        .cardnumberController,
                titleText: 'Card Number'),
            AppCustomForm(
                hintText:
                    'Enter your Phone Number',
                icon: Ionicons.call_outline,
                controller:
                    studentFormControllerImpl
                        .phoneController,
                keyboardType: TextInputType.phone,
                titleText: 'Phone Number'),

            // DROPDOWN BUTTON

            const AppDropDawonList(),
            AppCustomForm(
                hintText:
                    'Enter your Supervisor id',
                icon: Ionicons.person_add_outline,
                controller:
                    studentFormControllerImpl
                        .supervisorIdController,
                titleText: 'Supervisor id'),

            const AppPickFile(),

            const SizedBox(
              height: 20,
            ),

            AppCustomButton(
              label: 'Submit',
              onTap: () { 
                studentFormControllerImpl
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
