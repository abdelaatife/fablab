import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fablab/controller/home/posts_controller.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
PostsControllerImpl postsController =
        Get.put(PostsControllerImpl());
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: postsController.collectionStream,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot>
                  snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
    
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const  Text("Loading");
            }
    
            return ListView(
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()!
                        as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['title']),
                  
                );
              }).toList(),
            );
          }),
    );
  }
}
