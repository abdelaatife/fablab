
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:fablab/data/static/data.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jiffy/jiffy.dart';
import 'package:like_button/like_button.dart';

class AppPostHeadViewer extends StatelessWidget {
   final Color color;
  final String personName;
  final Timestamp date;
  const AppPostHeadViewer(
      {Key? key,
       required this.color,
      required this.personName,
      required this.date, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: color,
          backgroundImage: const AssetImage(
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
            Text(
             personName,
              style: const TextStyle(
                  fontSize: 17,
                  height: 1.5,
                  fontFamily: AppText.medium,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              Jiffy(date.toDate()).format('dd/MM/yyyy'),
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: AppText.medium,
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
                      ? AppColor.secondry
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
