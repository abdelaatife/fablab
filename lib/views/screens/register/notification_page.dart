import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/controller/notifcation_controller.dart';
import 'package:fablab/core/constant/style.dart';
import 'package:fablab/views/widgets/register/notification/nonotification_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationControllerImpl
        notificationControllerImpl =
        Get.put(NotificationControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondry,
        elevation: 2,
        title: const Text(
          'Notifications',
          style: TextStyle(
              fontFamily: AppText.light),
        ),
      ),
      body: Column(
        children: [
          GetBuilder<NotificationControllerImpl>(
              init: notificationControllerImpl,
              builder: (controller) {
                return Expanded(
                  child: StreamBuilder<
                          QuerySnapshot>(
                      stream:
                          notificationControllerImpl
                              .collectionStream,
                      builder: (BuildContext
                              context,
                          AsyncSnapshot<
                                  QuerySnapshot>
                              snapshot) {
                        if (snapshot.hasError) {
                          return const Text(
                              'Something went wrong');
                        }

                        if (snapshot
                                .connectionState ==
                            ConnectionState
                                .waiting) {
                          return const Text(
                              "Loading");
                        }

                        return ListView(
                          padding:
                              EdgeInsets.zero,
                          children: snapshot
                              .data!.docs
                              .map(
                                  (DocumentSnapshot
                                      document) {
                            Map<String, dynamic>
                                data =
                                document.data()!
                                    as Map<String,
                                        dynamic>;
                            return Dismissible(
                                    crossAxisEndOffset:
                                        500,
                                    key:
                                        UniqueKey(),
                                    onDismissed:
                                        ((direction) {
                                      controller.deleteNotification(
                                          document
                                              .id);
                                    }),
                                    background:
                                        Container(
                                      color: Colors
                                          .red,
                                      child: const Icon(
                                          Icons
                                              .delete),
                                    ),
                                    child:
                                        ListTile(
                                      title: Text(
                                          data[
                                              'not']),
                                    ),
                                  );
                          }).toList(),
                        );
                      }),

                  /* controller.lenght == 0
                      ? const AppNoNotificationWidget()
                      : ListView.builder(
                          itemCount:
                              controller.lenght,
                          itemBuilder:
                              (BuildContext
                                      context,
                                  int index) {
                            return Dismissible(
                              crossAxisEndOffset:
                                  500,
                              key: UniqueKey(),
                              onDismissed:
                                  ((direction) {
                                controller
                                    .deleteNotification(
                                        index);
                              }),
                              background:
                                  Container(
                                color: Colors.red,
                                child: const Icon(
                                    Icons.delete),
                              ),
                              child: controller.a[
                                          index] ==
                                      null
                                  ? Container()
                                  : ListTile(
                                      title: Text(
                                          controller
                                              .a[index]),
                                    ),
                            );
                          },
                        ),*/
                );
              }),
        ],
      ),
    );
  }
}
