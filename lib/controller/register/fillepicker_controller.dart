import 'dart:io';

import 'package:file_picker/file_picker.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FilepickerController
    extends GetxController {
  late String fileName;
  late File file;
  late bool isFilePicked = false;
   pickFile();
 }

class FilepickerControllerImpl
    extends FilepickerController {
  @override
  pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'jpg',
        'png',
        'jpeg',
        'docx',
      ],
    );

    if (result != null) {
      fileName = result.files.single.name;
      file = File(result.files.single.path!);
      isFilePicked = true;
      update();
       
    } else {
      Get.snackbar(
        'Error',
        'No file selected',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  
}
