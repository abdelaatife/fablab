 
 import 'package:fablab/views/widgets/register/studentform.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
class StudentForm extends StatelessWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> arg =
        Get.arguments;

    return Scaffold(
      backgroundColor: arg[0]['color'],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Colors.black),
        backgroundColor: arg[0]['color'],
        centerTitle: true,
        title: Text(
          "${arg[0]['description']}",
          style: const TextStyle(
            fontSize: 20,
            height: 1.5,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.18,
            width: Get.width,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(arg[0]['image'],
                    height: Get.height * 0.27),
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10),
              child: Column(
                children:  [
                   
                 AppStudentForm(
                  color: arg[0]['color'],
                 ) ,

            

                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
