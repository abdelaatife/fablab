import 'package:flutter/material.dart';

import '../../../../core/constant/style.dart';

class AppNoNotificationWidget extends StatelessWidget {
  const AppNoNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              'There is no notifications yet',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  fontFamily: AppText.light)),
          Image.asset(
              "assets/images/notifications.png")
        ],
      );
  }
}