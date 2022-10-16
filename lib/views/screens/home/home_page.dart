import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/controller/home/posts_controller.dart';
import 'package:fablab/controller/notifcation_controller.dart';
import 'package:fablab/core/constant/postavatarcolor.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:fablab/views/widgets/home/post/imageviewer.dart';
import 'package:fablab/views/widgets/home/post/postheaderviewer.dart';
import 'package:fablab/views/widgets/home/post/reactionbarviewer.dart';
import 'package:fablab/views/widgets/home/post/textviewer.dart';
import 'package:fablab/views/widgets/home/tite_homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../register/notification_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostsControllerImpl postsController =
        Get.put(PostsControllerImpl());
    NotificationControllerImpl
        notificationControllerImpl =
        Get.put(NotificationControllerImpl());
    
    return Scaffold(
        backgroundColor: AppColor.background,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GetBuilder<
                  NotificationControllerImpl>(
              init: notificationControllerImpl,
              builder: (controller) {
                return Badge(
                  // variable badge content
                  showBadge:
                      controller.lenght == 0
                          ? false
                          : true,
                  badgeContent: Text(
                    controller.lenght.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11),
                  ),
                  ///////////////////////////
                  badgeColor: Colors.red[400]!,
                  position: const BadgePosition(
                    end: 10,
                    top: 10,
                  ),
                  padding:
                      const EdgeInsets.all(5),
                  child: IconButton(
                      onPressed: () {
                        Get.to(
                          const NotificationsPage(),
                          duration:
                              const Duration(
                                  milliseconds:
                                      300),
                          transition: Transition
                              .rightToLeft,
                          curve: Curves.easeIn,
                        );
                      },
                      icon: const Icon(
                        Ionicons
                            .notifications_outline,
                        size: 30,
                      )),
                );
              }),
          toolbarHeight: 68,
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                  margin:
                      const EdgeInsets.all(10),
                  width: Get.width * .13,
                  child: const Icon(
                    Ionicons.person_outline,
                    color: Colors.white,
                  )),
            )
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
                            'There is no posts yet',
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
                                imageUrls: data[
                                    'imageUrls'],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AppPostReactionBarViewer(
                                postId:
                                    document.id,
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
