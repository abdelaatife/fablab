import 'package:fablab/controller/register/fillepicker_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/views/screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class StudentFormController
    extends GetxController {
  // form fields controllers
  late TextEditingController fullnameController;
  late TextEditingController cardnumberController;
  late TextEditingController phoneController;
  late String yearController = "null";
  late String fillUrl;
  late TextEditingController
      supervisorIdController;

  // firebase variables
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  CollectionReference students = FirebaseFirestore
      .instance
      .collection('Students');
      FirebasePerformance performance = FirebasePerformance.instance;
//get file picker controller
  FilepickerControllerImpl controllerImpl =
      Get.put(FilepickerControllerImpl());
  // list of years for dropdown button
  final List<String> items = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
    '5th Year',
  ];
  final String userid =
      FirebaseAuth.instance.currentUser!.uid;
  validtor();
  uploadFile();
  addUser();
}

class StudentFormControllerImpl
    extends StudentFormController {
  // on init
  @override
  void onInit() {
    fullnameController = TextEditingController();
    cardnumberController =
        TextEditingController();
    phoneController = TextEditingController();
    supervisorIdController =
        TextEditingController();

    super.onInit();
  }

// dispose
  @override
  void dispose() {
    fullnameController.dispose();
    cardnumberController.dispose();
    phoneController.dispose();
    supervisorIdController.dispose();

    super.dispose();
  }

// validator
  @override
  validtor() {
    if (fullnameController.text.isEmpty ||
        cardnumberController.text.isEmpty ||
        phoneController.text.isEmpty ||
        supervisorIdController.text.isEmpty) {
      Get.snackbar(
          "Error", "Please fill all fields",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else if (yearController == 'null') {
      Get.snackbar("Error", "Please select year",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else if (controllerImpl.isFilePicked ==
        false) {
      Get.snackbar("Error", "Please select file",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else {
      uploadFile();
    }
  }

// upload file
  @override
  uploadFile() async {
    // start trace
    final trace = performance.newTrace('upload_file_student_form');
    trace.start();
    trace.setMetric('upload_file_student_form', 1);

    try {
      Reference reference = FirebaseStorage
          .instance
          .ref('Students/$userid')
          .child(controllerImpl.fileName);

      reference.putFile(controllerImpl.file).then(
          (p0) => p0.ref
                  .getDownloadURL()
                  .then((value) {
                fillUrl = value;
                addUser();
              }));
      update();
      trace.stop();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      trace.stop();
    }
  }

// add user
  @override
  addUser() async {
    // start trace
    final trace = performance.newTrace('add_user_student_form');
    trace.start();
    trace.setMetric('add_user_student_form', 1);
    try {
      students.doc(userid).set({
        'fullname': fullnameController.text,
        'cardnumber': cardnumberController.text,
        'phone': phoneController.text,
        'year': yearController,
        'fillUrl': fillUrl,
        'date': DateTime.now(),
        'status': 'waiting',
        'supervisorId':
            supervisorIdController.text,
      }).then((value) {
        Get.snackbar(
          'Success',
          'Student added successfully',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        Get.off(() => const Dashboard());
        trace.stop();
      });
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      trace.stop();
    }
  }
}
