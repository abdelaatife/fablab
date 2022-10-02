import 'package:fablab/views/widgets/setup/card_setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/style.dart';

class AppSetupBody extends StatelessWidget {
  const AppSetupBody({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                ),
              ],
            ),
          ),
        ));
  }
}
