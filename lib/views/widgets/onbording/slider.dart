import 'package:fablab/core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../controller/onbording_controller.dart';
import '../../../data/static/statics.dart';

class OnBordingSlider
    extends GetView<OnBoardingControllerImp> {
  const OnBordingSlider({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBordingList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(onBordingList[index].title!,
                    style: const TextStyle(
                        fontSize: 28,
                        fontFamily: AppText.light,
                        color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Image.asset(
                    onBordingList[index]
                        .imageUrl!,
                  ),
                ),
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                   const  SizedBox(
                      height: 10,
                    ),
                    Text(
                        onBordingList[index]
                            .description!,
                        textAlign:
                            TextAlign.center,
                        style:   TextStyle(
                            fontSize: 16,
                            fontFamily:
                                AppText.light,
                            color: const  Color.fromARGB(255, 6, 10, 31).withOpacity(.8))),
                 const   SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
