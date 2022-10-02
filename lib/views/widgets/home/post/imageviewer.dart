 import 'package:flutter/material.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

class AppPostImageViewer extends StatelessWidget {
  final dynamic imageUrls;

  const AppPostImageViewer(
      {Key? key, required this.imageUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<String> images = [];
    imageUrls.forEach((element) {
      images.add(element);
    });
    return MultiImageViewer(
      images: images,
    );
  }
}
