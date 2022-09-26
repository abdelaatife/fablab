// this page contain the header of home page

import 'package:flutter/material.dart';
import '../../core/constant/style.dart';

class AppTitelHomePage extends StatelessWidget {
  const AppTitelHomePage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Hey Abdellatif,',
              style: TextStyle(
                  color: AppColor.text,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Register Now in Fablab and Release your Project',
              style: TextStyle(
                  color: AppColor.text
                      .withOpacity(.7),
                  height: 2,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
