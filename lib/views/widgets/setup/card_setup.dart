import 'package:flutter/material.dart';

import '../../../core/constant/style.dart';

class AppSetupCard extends StatelessWidget {
  final  String   title , description , image;
  const AppSetupCard({Key? key, required this.title, required this.description, required this.image}) : super(key: key);
      

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration:   BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      image),
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
                children:   [
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
