import 'package:fablab/controller/materilaspage_controller.dart';
import 'package:fablab/views/widgets/setup/card_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/style.dart';

class AppSetupBody extends StatelessWidget {
  const AppSetupBody({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialsPageControllerImpl
        materialsPageController =
        Get.put(MaterialsPageControllerImpl());
    return Expanded(
        flex: 3,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColor.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Available Materials',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                        color: AppColor.secondry,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GetBuilder<
                      MaterialsPageControllerImpl>(
                      init: materialsPageController,
                    builder: (controller) {
                      return StreamBuilder(
                        stream:
                            materialsPageController
                                .posts
                                .snapshots(),
                        builder: (ctx,
                            streamSnapshot) {
                          if (streamSnapshot
                                  .connectionState ==
                              ConnectionState
                                  .waiting) {
                            return const Center(
                                child:
                                    CircularProgressIndicator());
                          }
                          materialsPageController
                                  .documents =
                              streamSnapshot
                                  .data!.docs;
                          //todo Documents list added to filterTitle
                          if (materialsPageController
                              .searchText
                              .isNotEmpty) {
                            materialsPageController
                                    .documents =
                                materialsPageController
                                    .documents
                                    .where(
                                        (element) {
                              return element
                                  .get('material')
                                  .toString()
                                  .toLowerCase()
                                  .startsWith(
                                      materialsPageController
                                          .searchText
                                          .toLowerCase());
                            }).toList();
                          }

                          return GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing:
                                  10,
                              mainAxisSpacing: 10,
                            ),
                            padding:
                                EdgeInsets.zero,
                            children:
                                materialsPageController
                                    .documents
                                    .map((e) =>
                                        AppSetupCard(
                                          image: e[
                                              'imageUrls'],
                                          title: e[
                                              'material'],
                                          description:
                                              e['materialdescription'],
                                        ))
                                    .toList(),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
 