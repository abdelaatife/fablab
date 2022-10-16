import 'package:flutter/material.dart';

import '../../../../core/constant/style.dart';

class AppHaveAcountText extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;
  const AppHaveAcountText(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: ThemeData()
                .textTheme
                .headline1!
                .copyWith(),
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            child: Text(
              text2,
              style: ThemeData()
                  .textTheme
                  .headline1!
                  .copyWith(
                      color: AppColor.secondry),
            ),
          )
        ],
      ),
    );
  }
}
