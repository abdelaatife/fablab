import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class NotificationController
    extends GetxController {
  late List a = [];
  late int lenght = 0;
  final String userId =
      FirebaseAuth.instance.currentUser!.uid;
  final Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth
              .instance.currentUser!.uid)
          .collection('notification')
          .snapshots();
  deleteNotification(String id) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth
            .instance.currentUser!.uid)
        .collection('notification')
        .doc(id)
        .delete();
  }
}

class NotificationControllerImpl
    extends NotificationController {
  /// this function to read data from database
  @override
  void onInit() {
    final Stream<QuerySnapshot> collectionStream =
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth
                .instance.currentUser!.uid)
            .collection('notification')
            .snapshots();
    collectionStream.listen((event) {
      a.clear();
      for (var element in event.docs) {
        a.add(element.data());
      }

      lenght = a.length;
      update();
    });

    super.onInit();
  }

  /// this function to delete data from database
  /// delete notification

}
