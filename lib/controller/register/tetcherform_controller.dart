import 'package:fablab/controller/register/fillepicker_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/views/screens/dashboard.dart';
import 'package:firebase_performance/firebase_performance.dart';
 import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class TetchearFormController
    extends GetxController {
  // form fields controllers
  late TextEditingController fullnameController,
      emailController,
      sepiclizationController,
      officenumberController;

  late String fillUrl;

  // firebase variables
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  CollectionReference teachers = FirebaseFirestore
      .instance
      .collection('teachers');
      FirebasePerformance performance = FirebasePerformance.instance;
//get file picker controller
  FilepickerControllerImpl controllerImpl =
      Get.put(FilepickerControllerImpl());

  validtor();
  uploadFile();
  addUser();
}

class TetchearFormControllerImpl
    extends TetchearFormController {
  // on init
  @override
  void onInit() {
    fullnameController = TextEditingController();
    emailController = TextEditingController();
    sepiclizationController =
        TextEditingController();
    officenumberController =
        TextEditingController();
    super.onInit();
  }

// dispose
  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    sepiclizationController.dispose();
    officenumberController.dispose();

    super.dispose();
  }

// validator
  @override
  validtor() {
    if (fullnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        sepiclizationController.text.isEmpty ||
        officenumberController.text.isEmpty) {
      Get.snackbar(
          "Error", "Please fill all fields",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } else if (controllerImpl.isFilePicked ==
        false) {
      Get.snackbar(
          "Error", "Please select picture",
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
    final trace = performance.newTrace('upload_file_teacher_form');
   trace.start();
    trace.setMetric('file_size', 100);
    try { 
      Reference reference = FirebaseStorage
          .instance
          .ref('Teachers')
          .child(controllerImpl.fileName);

      reference.putFile(controllerImpl.file ).then(
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
    final trace = performance.newTrace('add_user_teacher_form');
    trace.start();
    trace.setMetric('add_user_teacher_form', 1);
    try {
      teachers.doc().set({
        'fullname': fullnameController.text,
        'email': emailController.text,
        'sepiclization':
            sepiclizationController.text,
        'officenumber':
            officenumberController.text,
        'fileUrl': fillUrl,
        'date': DateTime.now(),
        'id': 'FL${officenumberController.text}',
        'status' : 'waiting'
      }).then((value) {
        Get.snackbar(
          'Success',
          'Teacher added successfully',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        Get.offAll(() => const Dashboard());
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
