import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/controller/register/superevisor_controller.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SupervisiorsPage extends StatelessWidget {
  const SupervisiorsPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SupervisorControllerImpl
        supervisorController =
        Get.put(SupervisorControllerImpl());
    List<Map<String, dynamic>> arg =
        Get.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColor.secondry,
        title: const Text(
          'explore the supervisiors',
          style: TextStyle(
              fontFamily: AppText.light),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: supervisorController
              .collectionStream,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot>
                  snapshot) {
            if (snapshot.hasError) {
              return const Text(
                  'Something went wrong');
            }

            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const Text("Loading");
            }
            if (snapshot.data!.docs.isEmpty) {
              return Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: const [
                      Icon(
                          Ionicons
                              .cloud_offline_outline,
                          color: Colors.black54),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'There is no supervisors yet',
                        style: TextStyle(
                            fontFamily:
                                AppText.light,
                            color:
                                Colors.black54),
                      )
                    ],
                  )
                ],
              );
            }

            return ListView(
              padding: EdgeInsets.zero,
              children: snapshot.data!.docs.map(
                  (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()!
                        as Map<String, dynamic>;
                return Padding(
                  padding:
                      const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius:
                            BorderRadius.circular(
                                10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black
                                  .withOpacity(
                                      0.15),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset:
                                  const Offset(
                                      0, 1))
                        ]),
                    width: Get.width,
                    
                    padding:
                        const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 30,
                              backgroundColor:
                                  arg[0]['color'],
                              backgroundImage:
                                  NetworkImage(data[
                                      'fileUrl']),
                              child: const Icon(
                                Ionicons
                                    .person_outline,
                                color: Colors
                                    .black54,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Text(
                                  data['fullname']
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily:
                                          AppText
                                              .light,
                                      fontWeight:
                                          FontWeight
                                              .w500,
                                      fontSize:
                                          16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'SuperVisor ID:',
                                      style: TextStyle(
                                          fontFamily:
                                              AppText
                                                  .light,
                                          color: Colors
                                              .black54,
                                          fontSize:
                                              12),
                                    ),
                                    Text(
                                      ' ${data['id']}',
                                      style: const TextStyle(
                                          fontFamily:
                                              AppText
                                                  .light,
                                          fontWeight:
                                              FontWeight
                                                  .w500,
                                          fontSize:
                                              12),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Ionicons
                                      .reader_outline,
                                  color: Colors
                                      .black45,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Speciality:  ",
                                  style: TextStyle(
                                      fontFamily:
                                          AppText
                                              .light,
                                      color: Colors
                                          .black54,
                                      fontSize:
                                          13),
                                ),
                                Text(
                                  data['sepiclization']
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily:
                                          AppText
                                              .light,
                                      color: Colors
                                          .black87),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Ionicons
                                      .mail_outline,
                                  color: Colors
                                      .black45,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Email:  ",
                                  style: TextStyle(
                                      fontFamily:
                                          AppText
                                              .light,
                                      color: Colors
                                          .black54,
                                      fontSize:
                                          13),
                                ),
                                Text(
                                  data['email'],
                                  style:
                                      const TextStyle(
                                    fontFamily:
                                        AppText
                                            .light,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Ionicons
                                      .file_tray_full_outline,
                                  color: Colors
                                      .black45,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Office Number:  ",
                                  style: TextStyle(
                                      fontFamily:
                                          AppText
                                              .light,
                                      color: Colors
                                          .black54,
                                      fontSize:
                                          13),
                                ),
                                Text(
                                  data['officenumber']
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily:
                                          AppText
                                              .light,
                                      color: Colors
                                          .black87),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
