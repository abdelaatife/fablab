import 'package:flutter/material.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

class AppPostImageViewer extends StatelessWidget {
  const AppPostImageViewer({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MultiImageViewer(
      images: [
        "https://picsum.photos/id/1/200/300",
        "https://picsum.photos/id/2/200/300",
        "https://picsum.photos/id/3/200/300",
        "https://picsum.photos/id/1/200/300",
        "https://picsum.photos/id/2/200/300",
        "https://picsum.photos/id/3/200/300",
      ],
    );
  }
}
