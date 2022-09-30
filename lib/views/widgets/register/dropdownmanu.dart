// this is a dropdown menu widget

import 'package:dropdown_button2/dropdown_button2.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/register/studentform_controller.dart';

class AppDropDawonList extends StatelessWidget {
  const AppDropDawonList({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentFormControllerImpl
        studentFormControllerImpl =
        Get.put(StudentFormControllerImpl());

    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20, bottom: 10, left: 5),
            child: Row(
              children: [
                Text(
                  "Wich year are you in?",
                  style: TextStyle(
                    color: Colors.black
                        .withOpacity(.8),
                  ),
                ),
              ],
            ),
          ),
            DropdownButtonFormField2(
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey,
                    contentPadding:
                        EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                              10),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select the year',
                    style:
                        TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding:
                      const EdgeInsets.only(
                          left: 20, right: 10),
                  dropdownDecoration:
                      BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                  items: studentFormControllerImpl
                      .items
                      .map((item) =>
                          DropdownMenuItem<
                              String>(
                            value: item,
                            child: Text(
                              item,
                              style:
                                  const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    studentFormControllerImpl
                            .yearController =
                        value.toString();
                  },
                )
             
        ],
      ),
    );
  }
}
