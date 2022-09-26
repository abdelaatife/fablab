import 'package:fablab/core/constant/style.dart';
import 'package:fablab/data/static/card_data.dart';
import 'package:fablab/views/widgets/cart.dart';
import 'package:fablab/views/widgets/tite_homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Ionicons.menu_outline,
            size: 30,
          ),
          toolbarHeight: 68,
          actions: [
            Container(
                margin: const EdgeInsets.all(10),
                width: Get.width * .13,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    color: AppColor.secondry),
                child: const Icon(
                  Ionicons.person_outline,
                  color: Colors.white,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
          child: Column(
            children: [
              // header of home page
              const AppTitelHomePage(),
              SizedBox(
                height: Get.height * .08,
              ),
              //gridview builder of card
              Expanded(
                child: GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.80,
                  ),
                  itemCount: cardData.length,
                  itemBuilder:
                      (BuildContext context,
                          int index) {
                    return AppCart(
                      titel:
                          cardData[index].titel,
                      description: cardData[index]
                          .description,
                      image:
                          cardData[index].image,
                      color:
                          cardData[index].color,
                      onTap: cardData[index].onTap,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
