import 'package:badges/badges.dart';
import 'package:fablab/controller/notifcation_controller.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:fablab/views/screens/register/notification_page.dart';
import 'package:fablab/views/widgets/register/cards_gride.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class AppRegisterPage extends StatelessWidget {
  const AppRegisterPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationControllerImpl
        notificationControllerImpl =
        Get.put(NotificationControllerImpl());
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: Get.height * .3,
                width: Get.width * .7,
                decoration: BoxDecoration(
                  color: AppColor.secondry,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      Get.height,
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Register Now',
                            style: TextStyle(
                                fontFamily:
                                    AppText.light,
                                color:
                                    Colors.white,
                                fontSize: 25,
                                fontWeight:
                                    FontWeight
                                        .bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Select one of the form\nto continue ',
                            style: TextStyle(
                              fontFamily:
                                  AppText.light,
                              height: 1.7,
                              color: Colors.white
                                  .withOpacity(
                                      .8),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * .05,
              ),
              GetBuilder<
                      NotificationControllerImpl>(
                  init:
                      notificationControllerImpl,
                  builder: (controller) {
                    return Badge(
                      // variable badge content
                      showBadge: true,
                      badgeContent: Text(
                        "5",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11),
                      ),
                      ///////////////////////////
                      badgeColor:
                          Colors.red[400]!,
                      position:
                          const BadgePosition(
                        end: 23,
                        top: 0,
                      ),
                      padding:
                          const EdgeInsets.all(5),
                      child: IconButton(
                          onPressed: () {
                            Get.to(
                              const NotificationsPage(),
                              duration:
                                  const Duration(
                                      milliseconds:
                                          300),
                              transition:
                                  Transition
                                      .rightToLeft,
                              curve:
                                  Curves.easeIn,
                            );
                          },
                          icon: const Icon(
                            Ionicons
                                .notifications_outline,
                            size: 30,
                          )),
                    );
                  }),
            ],
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: AppCardsGrid(),
            ),
          )
        ],
      ),
    );
  }
}
