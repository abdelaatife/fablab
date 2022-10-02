import 'package:flutter/material.dart';

import '../../../core/constant/style.dart';

class AppSetupCard extends StatelessWidget {
  const AppSetupCard({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://3dandprint.eu/storage/productoptions/16/60094_large.jpg.webp"),
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
                children: const [
                  Text(
                    "3D Printing",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: AppText.light,
                        fontSize: 17),
                  ),
                  Text(
                    "lorem ipsum orem ipsumorem ips morem",
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
