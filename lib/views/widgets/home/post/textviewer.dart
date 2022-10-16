import 'package:expandable_text/expandable_text.dart';
import 'package:fablab/core/constant/style.dart';
 import 'package:flutter/material.dart';

class AppPostTextViewer extends StatelessWidget {
   final String text;
   final String title;
  const AppPostTextViewer(
      {Key? key,   required this.text, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //title
        Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontFamily: AppText.light,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        ExpandableText(
          text,
          expandText: 'show more',
          collapseText: 'show less',
          maxLines: 2,
          style: const TextStyle(
              fontSize: 14,
              fontFamily: AppText.light,
              height: 1.5),
          linkColor: Colors.blue,
        ),
      ],
    );
  }
}
