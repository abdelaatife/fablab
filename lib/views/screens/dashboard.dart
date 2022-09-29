import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/dashboard_conroller.dart';
import '../../core/constant/style.dart';
import '../../data/static/statics.dart';

class Dashboard
    extends GetView<DashboardController> {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    DashboardControllerImp controller =
        Get.put(DashboardControllerImp());
    return GetBuilder<DashboardControllerImp>(
        builder: (controller) {
      return Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: IndexedStack(
            children: [
              widgetOptions.elementAt(
                  controller.currentPage),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: bottomBarItems,
            selectedFontSize: 12,
            currentIndex: controller.currentPage,
            unselectedItemColor: AppColor.text,
            selectedItemColor: AppColor.secondry,
            onTap: (int index) {
              controller.onItemTapped(index);
            }),
      );
    });
  }
}
