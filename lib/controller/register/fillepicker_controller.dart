import 'dart:io';

import 'package:file_picker/file_picker.dart';
 import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';

abstract class FilepickerController
    extends GetxController {
  late String fileName;
  late File file;
   late bool isFilePicked = false;
  FirebasePerformance performance =
      FirebasePerformance.instance;
  pickFile();
  compressFile(File file);
}

class FilepickerControllerImpl
    extends FilepickerController {
  @override
  pickFile() async {
    Trace trace =
        performance.newTrace('pick_file_trace');
    trace.start();
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowCompression: true,
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
        trace.stop();
    } else {
      Get.snackbar(
        'Error',
        'No file selected',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      trace.stop();
    }
  }

  @override
  compressFile(File file) async {
    file =
        await FlutterNativeImage.compressImage(
            file.path,
            quality: 90,
            percentage: 70);
  }
}
