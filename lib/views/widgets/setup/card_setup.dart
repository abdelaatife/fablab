import 'package:flutter/material.dart';

import '../../../core/constant/style.dart';

class AppSetupCard extends StatelessWidget {
  final String title, description, image;
  const AppSetupCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
padding: const  EdgeInsets.all(3),
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
       ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: AppText.light,
                        fontSize: 17),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontFamily: AppText.light,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
