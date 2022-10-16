import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CommentsController
    extends GetxController {
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  FirebasePerformance performance =
      FirebasePerformance.instance;

  TextEditingController commentController =
      TextEditingController();
  addComment(String postId);
}

class CommentsControllerImpl
    extends CommentsController {
  @override
  void onInit() {
    commentController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  addComment(String postId) {
    Trace trace =
        performance.newTrace('add_comment_trace');
    trace.start();
    trace.setMetric('comment',
       1);
    CollectionReference comments =
        FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .collection('comments');
    comments.add({
      'comment': commentController.text,
      'person': FirebaseAuth
          .instance.currentUser!.displayName,
      'date': DateTime.now(),
    });

    commentController.clear();
    trace.stop();
  }
}
