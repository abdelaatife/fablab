import 'package:flutter/material.dart';

class AppSiginInText extends StatelessWidget {
  final String titel;
  final String text;
  const AppSiginInText(
      {Key? key,
      required this.titel,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start,
          children: [
            Text(
              titel,
              textAlign: TextAlign.left,
              style: ThemeData()
                  .textTheme
                  .headline1!
                  .copyWith(
                      fontSize: 26,
                      color: Colors.black87,
                      fontWeight:
                          FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start,
          children: [
            Text(
              text,
              textAlign: TextAlign.left,
              style: ThemeData()
                  .textTheme
                  .bodyText1!
                  .copyWith(
                    fontSize: 18,
                    
                    color: Colors.grey,
                  ),
            ),
          ],
        )
      ],
    );
  }
}
