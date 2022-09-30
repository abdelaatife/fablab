import 'package:fablab/data/static/data.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

class AppPostImageViewer extends StatelessWidget {
  final int index;
  const AppPostImageViewer({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MultiImageViewer(
      images:  data["$index"]!.imageUrls,
    );
  }
}
