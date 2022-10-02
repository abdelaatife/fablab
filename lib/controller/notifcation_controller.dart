import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

abstract class NotificationController
    extends GetxController {
  late List a = [];
  late int lenght = 0;
  final Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance
          .collection('notification').orderBy('not',descending: true)
          .snapshots();
  deleteNotification(String id) {
    FirebaseFirestore.instance
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
    a.clear();

    DatabaseReference starCountRef =
        FirebaseDatabase.instance
            .ref('users/123/notification');
    starCountRef.onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null) {
        a = data as List;
        lenght = data.length;

        update();
      }
    });

    super.onInit();
  }

  /// this function to delete data from database
  /// delete notification

   

 
}
