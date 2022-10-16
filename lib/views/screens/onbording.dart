 
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../controller/onbording_controller.dart';
import '../widgets/onbording/custom_button.dart';
import '../widgets/onbording/dote_sroling.dart';
import '../widgets/onbording/slider.dart';
 
 class Onbording extends StatelessWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [
          OnBordingSlider(),
          DoteSrolingOnbording(),
          CustomButtonOnbording(),
        ],
      )),
    );
  }
}
