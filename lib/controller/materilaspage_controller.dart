import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

abstract class MaterialsPageController
    extends GetxController {
  // firebase firestore and firebase storage variables
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  final CollectionReference posts =
      FirebaseFirestore.instance
          .collection('materials');
  final Reference storageRef =
      FirebaseStorage.instance.ref("materials");

  final Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance
          .collection('materials')
          .snapshots();
 }

class MaterialsPageControllerImpl
    extends MaterialsPageController {
  
}
