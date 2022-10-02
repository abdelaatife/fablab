import 'package:fablab/views/widgets/setup/search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/style.dart';

class AppSetupHead extends StatelessWidget {
  const AppSetupHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10),
              child: Stack(children: [
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      height: Get.height * .3,
                      width: Get.width * .5,
                      decoration:
                          const BoxDecoration(
                              image:
                                  DecorationImage(
                                      image:
                                          AssetImage(
                        "assets/images/setup.png",
                      ))),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        Row(
                          children: const [
                            Text(
                                "Explore the materials\nand start your\nproject",
                                style: TextStyle(
                                    color: Colors
                                        .white,
                                    height: 1.8,
                                    fontFamily:
                                        AppText
                                            .light,
                                    fontSize: 17)),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * .03,
                        ),
                       const  AppSearchInput()
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
  }
}