import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MaterialsPageController
    extends GetxController {
  // firebase firestore and firebase storage variables
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  TextEditingController searchcontroller =
      TextEditingController();
  final CollectionReference posts =
      FirebaseFirestore.instance
          .collection('materials');
  final Reference storageRef =
      FirebaseStorage.instance.ref("materials");
  List<DocumentSnapshot> documents = [];

  late String searchText = ''   ;
  final Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance
          .collection('materials')
          .snapshots();
  search(value);
}

class MaterialsPageControllerImpl
    extends MaterialsPageController {
  @override
  void onInit() {
    searchcontroller = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchcontroller.dispose();
    super.dispose();
  }

  @override
  void search(value) {
    searchText = value;
    update();
  }
}
