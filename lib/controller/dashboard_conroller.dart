import 'package:get/get.dart';

abstract class DashboardController
    extends GetxController {
  onItemTapped(int index);
}

class DashboardControllerImp
    extends DashboardController {
  late int currentPage = 0;
  


@override
   
  @override
  onItemTapped(int index) {
    currentPage = index;

    update();
  }
}
