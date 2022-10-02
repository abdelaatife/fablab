import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:fablab/controller/home/posts_controller.dart';
import 'package:fablab/core/constant/postavatarcolor.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:fablab/data/static/data.dart';
import 'package:fablab/views/widgets/home/post/imageviewer.dart';
import 'package:fablab/views/widgets/home/post/postheaderviewer.dart';
import 'package:fablab/views/widgets/home/post/reactionbarviewer.dart';
import 'package:fablab/views/widgets/home/post/textviewer.dart';
import 'package:fablab/views/widgets/home/tite_homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostsControllerImpl postsController =
        Get.put(PostsControllerImpl());
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(
          onPressed: () {
            postsController.getPostData();
          },
        ),
        backgroundColor: AppColor.background,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Ionicons.menu_outline,
            size: 30,
          ),
          toolbarHeight: 68,
          actions: [
            Container(
                margin: const EdgeInsets.all(10),
                width: Get.width * .13,
                child: const Icon(
                  Ionicons.person_outline,
                  color: Colors.white,
                ))
          ],
        ),
        body: Column(
          children: [
            // header of home page
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: AppTitelHomePage(),
            ),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
              
                  stream: postsController
                      .collectionStream,
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
                      return const Text(
                          "Loading");
                          
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
                        return Container(
                          width: Get.width,
                          color: Colors.white,
                          margin: const EdgeInsets
                              .only(bottom: 10),
                          padding:
                              const EdgeInsets
                                  .all(10),
                          child: Column(
                            children: [
                              AppPostHeadViewer(
                                
                                  date: data[
                                      'date'],
                                  personName: data[
                                      'personName'],
                                  color: postAvatarColor[
                                      data[
                                          'color']]!),
                              const SizedBox(
                                height: 15,
                              ),
                              AppPostTextViewer(
                                text: data[
                                    'description'],
                                title:
                                    data['title'],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AppPostImageViewer(
                                imageUrls:
                                    data['imageUrls'],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AppPostReactionBarViewer(
                                postId: document.id,
                                likes:
                                    data['likes'],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }),

           
            ),
          ],
        ));
  }
}
   /* ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder:
                    (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: data.length,
                itemBuilder:
                    (BuildContext context,
                        int index) {
                  return Container(
                    width: Get.width,
                    color: Colors.white,
                    margin: const EdgeInsets.only(
                        bottom: 10),
                    padding:
                        const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        AppPostHeadViewer(
                          index: index + 1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AppPostTextViewer(
                          index: index + 1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AppPostImageViewer(
                          index: index + 1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AppPostReactionBarViewer(
                          index: index + 1,
                        ),
                      ],
                    ),
                  );
                },
              ),*/