import 'package:fablab/core/constant/style.dart';
import 'package:fablab/views/screens/setup/headui_setap.dart';
import 'package:fablab/views/widgets/register/textform.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondry,
      body: Column(
        children: [
          AppSetupHead() , 
          Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
