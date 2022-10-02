import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

abstract class RegisterController
    extends GetxController {
  late List b = [];
  late int lenght2 = 0;
    getNotificationlen();

}

class RegisterControllerImpl
    extends RegisterController {
      @override
  void onInit() {
     getNotificationlen();

    super.onInit();
  }
  @override
  getNotificationlen() {
    DatabaseReference starCountRef =
        FirebaseDatabase.instance
            .ref('users/123/notification');
    starCountRef.onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      if (data != null) {
        b = data as List;
        lenght2 = data.length;

        update();
      }
    });
  }
}
