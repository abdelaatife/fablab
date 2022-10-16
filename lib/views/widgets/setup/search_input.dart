import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../controller/materilaspage_controller.dart';
import '../../../core/constant/style.dart';

class AppSearchInput extends StatelessWidget {
  const AppSearchInput({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialsPageControllerImpl
        materialsPageController =
        Get.put(MaterialsPageControllerImpl());
    return TextField(
      controller: materialsPageController.searchcontroller,
      onChanged: (value) {
        materialsPageController.search(value);
      },
      decoration: InputDecoration(
 
        filled: true,
        contentPadding: const EdgeInsets.all(0),
        fillColor: const Color(0xFFF7FBFF),
        hintText: "Search Here",
        hintStyle: TextStyle(
          color: AppColor.text.withOpacity(.3),
          fontFamily: AppText.light,
          fontSize: 16,
        ),
        prefixIcon:
            const Icon(Ionicons.search_outline),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(30)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(30)),
        ),
      ),
    );
  }
}
