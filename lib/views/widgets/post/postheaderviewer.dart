import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:like_button/like_button.dart';

class AppPostHeadViewer extends StatelessWidget {
  const AppPostHeadViewer({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xFF58AEE1),
          backgroundImage: AssetImage(
            'assets/images/icon.png',
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "DR. Ahmed",
              style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey),
            ),
          ],
        ),
        Expanded(
            child: Row(
          mainAxisAlignment:
              MainAxisAlignment.end,
          children: [
            // save
            LikeButton(
              size: 30,
              likeBuilder: (isLiked) {
                return Icon(
                  Ionicons.bookmark_outline,
                  color: isLiked
                      ? Colors.green
                      : Colors.grey,
                  size: 25,
                );
              },
              countBuilder:
                  (count, isLiked, text) {
                var color = isLiked
                    ? Colors.blue
                    : Colors.grey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "Save",
                    style:
                        TextStyle(color: color),
                  );
                } else {
                  result = Text(
                    text,
                    style:
                        TextStyle(color: color),
                  );
                }
                return result;
              },
            )
          ],
        ))
      ],
    );
  }
}
