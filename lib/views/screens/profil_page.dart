import 'package:fablab/core/constant/style.dart';
import 'package:fablab/views/screens/auth/loggin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user =
        FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Container(
                height: Get.height * .2,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColor.secondry,
                  borderRadius:
                      BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0,
                          3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width * .05,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor:
                            Colors.white,
                        foregroundColor:
                            Colors.white,
                        backgroundImage: AssetImage(
                            'assets/images/Internship.png'),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .05,
                    ),
                    Flexible(
                      child: Text(
                          user.displayName!,
                          style: const TextStyle(
                              fontFamily:
                                  AppText.light,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight:
                                  FontWeight
                                      .bold)),
                    ),
                  ],
                )),
            SizedBox(
              height: Get.height * .04,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0,
                          3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Ionicons
                          .person_outline),
                      title: Text(
                          'Apllication status',
                          style: TextStyle(
                              fontFamily:
                                  AppText.light)),
                      subtitle: Text('Pending',
                          style: TextStyle(
                              fontFamily:
                                  AppText.light)),
                    ),
                    ListTile(
                        leading: const Icon(
                            Ionicons
                                .mail_outline),
                        title: const Text('Email',
                            style: TextStyle(
                                fontFamily:
                                    AppText
                                        .light)),
                        subtitle: Text(
                            user.email!,
                            style: const TextStyle(
                                fontFamily:
                                    AppText
                                        .light))),
                    const ListTile(
                        leading: Icon(Ionicons
                            .call_outline),
                        title: Text('Phone',
                            style: TextStyle(
                                fontFamily:
                                    AppText
                                        .light)),
                        subtitle: Text(
                            'not provided',
                            style: TextStyle(
                                fontFamily:
                                    AppText
                                        .light))),
                    const ListTile(
                        leading: Icon(Ionicons
                            .settings_outline),
                        title: Text('Year',
                            style: TextStyle(
                                fontFamily:
                                    AppText
                                        .light)),
                        subtitle: Text(
                            'not provided',
                            style: TextStyle(
                                fontFamily:
                                    AppText
                                        .light))),
                    const ListTile(
                        leading: Icon(Ionicons
                            .card_outline),
                        title: Text('Card Number',
                            style: TextStyle(
                                fontFamily:
                                    AppText
                                        .light)),
                        subtitle: Text(
                          'not provided',
                          style: TextStyle(
                              fontFamily:
                                  AppText.light),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0,
                        3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  //logout

                  ListTile(
                    onTap: () {
                      FirebaseAuth.instance
                          .signOut();
                      Get.offAll(
                          () => const Login());
                    },
                    leading: Icon(
                      Ionicons.log_out_outline,
                      color: Colors.red[400],
                    ),
                    title: Text('Logout',
                        style: TextStyle(
                            fontFamily:
                                AppText.light,
                            color:
                                Colors.red[400])),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
