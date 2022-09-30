// this page contain the header of home page

import 'package:flutter/material.dart';
 import '../../../core/constant/style.dart';

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
                   fontFamily: AppText.bold,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Explore and Get Deeper in FabLab',
              style: TextStyle(
                  color: AppColor.text
                      .withOpacity(.7),
                  height: 1.5,
                  fontSize: 15,
                  fontFamily: AppText.medium,
                  ),
            ),
          ],
        ),
        const Padding(
          padding:
              EdgeInsets.symmetric(vertical: 15),
          child: Divider(),
        ),
        
      ],
    );
  }
}
