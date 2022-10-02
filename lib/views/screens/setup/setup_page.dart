import 'package:fablab/core/constant/style.dart';
import 'package:fablab/views/widgets/setup/body_setup.dart';
import 'package:fablab/views/widgets/setup/headui_setap.dart';
import 'package:flutter/material.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondry,
      body: Column(
        children: const [
          AppSetupHead(),
          AppSetupBody(),
        ],
      ),
    );
  }
}
