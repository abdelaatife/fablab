import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/controller/home/comments_controller.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsPage extends StatelessWidget {
  final String id;
  const CommentsPage({Key? key, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> collectionStream =
        FirebaseFirestore.instance
            .collection('posts')
            .doc(id)
            .collection("comments")
            .orderBy('date', descending: false)
            .snapshots();

    CommentsControllerImpl commentsController =
        Get.put(CommentsControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondry,
        title: const Text('Comments'),
      ),
      //we are still working on this page
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.end,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: collectionStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot>
                          snapshot) {
                    if (snapshot.hasError) {
                      return const Text(
                          'Something went wrong');
                    }

                    if (snapshot
                            .connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                          child:
                              CircularProgressIndicator(
                        color: AppColor.secondry,
                      ));
                    }
                    if (snapshot
                        .data!.docs.isEmpty) {
                      return Center(
                          child: Column(
                        children: [
                          Image.asset(
                              'assets/images/Posts-rafiki.png'),
                          const Text(
                            'There is no comment yet',
                            style: TextStyle(
                                color: Colors
                                    .black54,
                                fontSize: 17,
                                fontFamily:
                                    AppText
                                        .light),
                          )
                        ],
                      ));
                    }

                    return ListView(
                      padding: EdgeInsets.zero,
                      children: snapshot
                          .data!.docs
                          .map((DocumentSnapshot
                              document) {
                        Map<String, dynamic>
                            data =
                            document.data()!
                                as Map<String,
                                    dynamic>;
                        return Padding(
                          padding:
                              const EdgeInsets
                                  .all(1),
                          child: Container(
                              width: Get.width,
                              padding:
                                  const EdgeInsets
                                      .all(2.0),
                              decoration:
                                  BoxDecoration(
                                color:
                                    Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors
                                        .grey
                                        .withOpacity(
                                            0.1),
                                    spreadRadius:
                                        1,
                                    blurRadius: 7,
                                    offset:
                                        const Offset(
                                            0, 3),
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            10),
                              ),
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets
                                        .zero,
                                leading:
                                    const CircleAvatar(
                                  backgroundColor:
                                      Colors
                                          .transparent,
                                  child: Icon(
                                    Icons.comment,
                                    color: AppColor
                                        .secondry,
                                  ),
                                ),
                                title: Text(
                                  data['person'],
                                  style: TextStyle(
                                      color: Colors
                                          .black
                                          .withOpacity(
                                              .7),
                                      fontSize:
                                          17,
                                      height: 2,
                                      fontFamily:
                                          AppText
                                              .light),
                                ),
                                subtitle: Text(
                                  data['comment'],
                                  style: TextStyle(
                                      color: Colors
                                          .black
                                          .withOpacity(
                                              .8),
                                      fontSize:
                                          17,
                                      fontFamily:
                                          AppText
                                              .light),
                                ),
                              )),
                        );
                      }).toList(),
                    );
                  }),
            ),
            Container(
              color: Colors.grey[100],
              child: TextFormField(
                controller: commentsController
                    .commentController,
                decoration: InputDecoration(
                  hintText: "Add a comment...",
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: AppText.light),
                  contentPadding:
                      const EdgeInsets.only(
                          left: 15,
                          bottom: 11,
                          top: 11,
                          right: 15),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: AppColor.secondry,
                      size: 24,
                    ),
                    onPressed: () async {
                      if (commentsController
                          .commentController
                          .text
                          .isNotEmpty) {
                        await commentsController
                            .addComment(id);
                      } else {
                        Get.snackbar('Error',
                            'Please enter a comment',
                            snackPosition:
                                SnackPosition.TOP,
                            duration:
                                const Duration(
                                    seconds: 1),
                            backgroundColor:
                                Colors.red,
                            colorText:
                                Colors.white);
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
