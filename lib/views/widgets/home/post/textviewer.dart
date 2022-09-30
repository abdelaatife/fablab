import 'package:expandable_text/expandable_text.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:fablab/data/static/data.dart';
import 'package:flutter/material.dart';

class AppPostTextViewer extends StatelessWidget {
  final int index;
  const AppPostTextViewer(
      {Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //title
        Row(
          children: [
            Text(
              data['$index']!.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: AppText.bold,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ExpandableText(
          data['$index']!.description,
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
