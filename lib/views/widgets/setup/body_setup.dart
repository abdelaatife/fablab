import 'package:cloud_firestore/cloud_firestore.dart';
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
    MaterialsPageControllerImpl materialsPageController =
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
               const  SizedBox(
                  height: 20,
                ),
               Expanded(
                 child: StreamBuilder<
                         QuerySnapshot>(
                     stream:
                         materialsPageController
                             .collectionStream,
                     builder:
                         (BuildContext context,
                             AsyncSnapshot<
                                     QuerySnapshot>
                                 snapshot) {
                       if (!snapshot.hasData) {
                         return const Center(
                           child:
                               CircularProgressIndicator(),
                         );
                       }
                       if (snapshot.hasData) {
                         if (snapshot.hasError) {
                           return const Center(
                             child: Text(
                                 'Something went wrong'),
                           );
                         }
                         if (snapshot
                             .data!.docs.isEmpty) {
                           return Center(
                               child: Row(
                             mainAxisAlignment:
                                 MainAxisAlignment
                                     .center,
                             children: const [
                               Icon(
                                 Icons
                                     .cloud_off_outlined,
                                 color:
                                     Colors.black54,
                                 size: 30,
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               Text(
                                 'There is no materials yet',
                                 style: TextStyle(
                                     fontFamily:
                                         AppText
                                             .light,
                                     fontSize: 15,
                                     color: Colors
                                         .black54),
                               ),
                             ],
                           ));
                         }
                       }
                       if (snapshot
                               .connectionState ==
                           ConnectionState
                               .waiting) {
                         return const Center(
                           child:
                               CircularProgressIndicator(),
                         );
                       }

                       return GridView(
                         gridDelegate:
                          const   SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount:   2,
                           crossAxisSpacing: 10,
                           mainAxisSpacing: 10,
                         ),
                         padding: EdgeInsets.zero,
                         children: snapshot
                             .data!.docs
                             .map((DocumentSnapshot
                                 document) {
                           Map<String, dynamic>
                               data =
                               document.data()
                                   as Map<String,
                                       dynamic>;
                           return  AppSetupCard(
                               image:
                                data['imageUrls'],
                            title:
                                data['material'],
                            description: data[
                                'materialdescription'],
                           ) ;
                         }).toList(),
                       );
                     }),
               )
              ],
            ),
          ),
        ));
  }
}
/**  Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.80,
                      crossAxisCount: 2,
                    ),
                    itemCount: 50,
                    itemBuilder:
                        (BuildContext context,
                            int index) {
                      return const AppSetupCard();
                    },
                  ),
                ), */