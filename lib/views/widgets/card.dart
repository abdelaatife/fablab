//this page contain the card widget of home page
// i use gridview builder to show the card in home page
// this widget require 4 parameter
// the 4 parameter is the card model

 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCart extends StatelessWidget {
  final String titel, description, image;
  final Color color;
  final void Function() onTap;
  const AppCart({
    Key? key,
    required this.titel,
    required this.onTap,
    required this.description,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      titel,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: Get.height * .01,
                          left: Get.width * .03),
                      child: Image.asset(
                        image,
                        width: Get.width * .33,
                        height: Get.height * .17,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ])),
    );
  }
}
