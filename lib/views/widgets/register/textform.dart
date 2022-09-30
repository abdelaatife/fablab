import 'package:fablab/core/constant/style.dart';
import 'package:flutter/material.dart';

class AppCustomForm extends StatelessWidget {
  final String hintText;
  final String ? titleText;
  final IconData? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const AppCustomForm({
    Key? key,
    required this.hintText,
      this.titleText,
    this.icon,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FIRST NAME TEXT
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              Text(
                titleText ?? "",
                style: const TextStyle(
                    color: AppColor.text,
                    fontSize: 13,
                    height: 1.5),
              ),
            ],
          ),
        ),

        // FIRST NAME TEXT FIELD
        Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF7FBFF),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
              ),
              suffixIcon: Icon(icon),
              enabledBorder:
                  const OutlineInputBorder(
                borderSide: BorderSide(
                    width: .25,
                    color: AppColor.text),
                borderRadius: BorderRadius.all(
                    Radius.circular(10)),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
