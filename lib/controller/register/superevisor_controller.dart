import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

abstract class SupervisorController extends GetxController {
   FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  CollectionReference posts = FirebaseFirestore
      .instance
      .collection('supervisor');
  final Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance
          .collection('supervisor')
          .snapshots();
  
}

class SupervisorControllerImpl extends SupervisorController {
  
}