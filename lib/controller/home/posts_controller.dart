import 'package:firebase_performance/firebase_performance.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PostsController
    extends GetxController {
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  FirebasePerformance performance = FirebasePerformance.instance;
  CollectionReference posts = FirebaseFirestore
      .instance
      .collection('posts');
  final Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance
          .collection('posts')
          .snapshots();
   bool isLiked = false;
  likeCounter( bool isLiked , String postId);
  likePost(String postId);
}

class PostsControllerImpl
    extends PostsController {
   

  @override
  likeCounter(isLiked , postId) {
    if (isLiked) {
      posts.doc(postId).update({
        'likes': FieldValue.increment(-1),
      });
      return Future.value(!isLiked);
      
    } else {
      posts.doc('DRiMNaMbVKzMOKOvs8Ho').update({
        'likes': FieldValue.increment(1),
      });
      return Future.value(!isLiked);
      
    }
  }
  @override
  likePost(postId) {
    Trace trace = performance.newTrace('like_post_trace');
    trace.start();

    if (isLiked) {
      posts.doc(postId).update({
        'likes': FieldValue.increment(-1),
      });
      isLiked = false;
      update();
    } else {
      posts.doc(postId).update({
        'likes': FieldValue.increment(1),
      });
      isLiked = true;
      update();
    }
    trace.stop();
  } 
}
