import 'package:fablab/controller/home/posts_controller.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../../../screens/home/comments_page.dart';

class AppPostReactionBarViewer
    extends StatelessWidget {
  final int likes;
  final String postId;

  const AppPostReactionBarViewer({
    Key? key,
    required this.likes,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostsControllerImpl postsController =
        Get.put(PostsControllerImpl());

    return GetBuilder<PostsControllerImpl>(
      init: postsController,
      builder: (controller) {
        return Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
          children: [
            GetBuilder<PostsControllerImpl>(
              init: postsController,
              builder: (controller) {
                return LikeButton(
                  likeCount: likes,
                  size: 30,
                  likeBuilder: (isLiked) {
                    return Icon(
                      Icons.diamond_outlined,
                      color: controller.isLiked
                          ? AppColor.secondry
                          : Colors.grey,
                      size: 25,
                    );
                  },
                  onTap: (isLiked) {
                    postsController
                        .likePost(postId);
                    return Future.value(!isLiked);
                  },
                  countBuilder:
                      (count, isLiked, text) {
                    var color = controller.isLiked
                        ? Colors.indigo
                        : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "Valuable",
                        style: TextStyle(
                            color: color),
                      );
                    } else {
                      result = Text(
                        text,
                        style: TextStyle(
                            color: color),
                      );
                    }
                    return result;
                  },
                );
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
                Get.to(
                  CommentsPage(
                    id: postId,
                  ),
                  duration: const Duration(
                      milliseconds: 500),
                  transition: Transition
                      .rightToLeftWithFade,
                  curve: Curves.easeIn,
                );
                return Future.value(false);
              },
              likeBuilder: (isLiked) {
                return const Icon(
                  Icons.comment_outlined,
                  color: Colors.grey,
                  size: 25,
                );
              },
              countBuilder:
                  (count, isLiked, text) {
                var color = isLiked
                    ? Colors.deepPurpleAccent
                    : Colors.grey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "Comment",
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
            ),
          ],
        );
      },
    );
  }
}
