import 'package:expandable_text/expandable_text.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:fablab/views/widgets/post/imageviewer.dart';
import 'package:fablab/views/widgets/post/postheaderviewer.dart';
import 'package:fablab/views/widgets/post/reactionbarviewer.dart';
import 'package:fablab/views/widgets/post/textviewer.dart';
import 'package:fablab/views/widgets/tite_homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:like_button/like_button.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
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
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    color: AppColor.secondry),
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
              padding: EdgeInsets.only(
                left: 15 , top:  10),
              child: AppTitelHomePage(),
            ),

            Expanded(
              child: ListView.separated(
                separatorBuilder:
                    (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 2,
                itemBuilder:
                    (BuildContext context,
                        int index) {
                  return Container(
                    width: Get.width,
                    color:
                        Color.fromARGB(150, 221, 238, 255),
                    margin: const EdgeInsets.only(
                        bottom: 10),
                    padding:
                        const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        AppPostHeadViewer(),
                        SizedBox(
                          height: 15,
                        ),
                        AppPostTextViewer(),
                        SizedBox(
                          height: 15,
                        ),
                        AppPostImageViewer(),
                        SizedBox(
                          height: 15,
                        ),
                        AppPostReactionBarViewer(),
                        
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
