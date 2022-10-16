// this page contain the header of home page

import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
import '../../../core/constant/style.dart';

class AppTitelHomePage extends StatelessWidget {
  const AppTitelHomePage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   User user  = FirebaseAuth.instance.currentUser!;
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.end,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  color: AppColor.secondry,
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(40))),
            ),
          ],
        ),
        Row(
          children:   [
            Text(
              'Hey ${user.displayName!.split(' ')[0]} ,',
              style: const  TextStyle(
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
                color:
                    AppColor.text.withOpacity(.7),
                height: 1.5,
                fontSize: 15,
                fontFamily: AppText.medium,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Divider(),
        ),
      ],
    );
  }
}
