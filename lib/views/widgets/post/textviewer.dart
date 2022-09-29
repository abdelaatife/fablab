import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class AppPostTextViewer extends StatelessWidget {
  const AppPostTextViewer({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        //title
        Text(
          "The classical methods of monitoring blood",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        ExpandableText(
          "The classical methods of monitoring blood glucose such as the most used glucometer  which is an invasive method with a high cost and a limited number of measurements and also the existing non-invasive methods are too expensive and with low precision using saliva The classical methods of monitoring blood glucose such as the most used glucometer  which is an invasive method with a high cost and a limited number of measurements and also the existing non-invasive methods are too expensive and with low precision using saliva",
          expandText: 'show more',
          collapseText: 'show less',
          maxLines: 2,
          linkColor: Colors.blue,
        ),
      ],
    );
  }
}
