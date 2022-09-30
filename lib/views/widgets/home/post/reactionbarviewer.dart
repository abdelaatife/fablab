 import 'package:fablab/data/static/data.dart';
import 'package:flutter/material.dart';
 import 'package:like_button/like_button.dart';

class AppPostReactionBarViewer
    extends StatelessWidget {
  final int index;
  const AppPostReactionBarViewer(
      {Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
      children: [
        LikeButton(
          likeCount:  data['$index']!.likes,
          size: 30,
          likeBuilder: (isLiked) {
            return Icon(
              Icons.diamond_outlined,
              color: isLiked
                  ? Colors.indigo
                  : Colors.grey,
              size: 25,
            );
          },
          countBuilder: (count, isLiked, text) {
            var color = isLiked
                ? Colors.deepPurpleAccent
                : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "Valuable",
                style: TextStyle(color: color),
              );
            } else {
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            }
            return result;
          },
        ),

        Container(
          width: 1,
          height: 25,
          color: Colors.grey.shade400,
        ),
        // comment
        LikeButton(
          likeCount: 0,
          size: 30,
          onTap: (isLiked) {
            // Get.to(const CommentsPage());
            return Future.value(false);
          },
          likeBuilder: (isLiked) {
            return const Icon(
              Icons.comment_outlined,
              color: Colors.grey,
              size: 25,
            );
          },
          countBuilder: (count, isLiked, text) {
            var color = isLiked
                ? Colors.deepPurpleAccent
                : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "Comment",
                style: TextStyle(color: color),
              );
            } else {
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            }
            return result;
          },
        ),
      ],
    );
  }
}
