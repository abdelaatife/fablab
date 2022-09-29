import 'package:flutter/material.dart';

 
class AppCustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final void Function() onTap;
  const AppCustomButton(
      {Key? key,
      required this.label,
      required this.onTap, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
     
  }
}
 