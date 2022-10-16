import 'package:fablab/views/widgets/register/card.dart';
import 'package:flutter/material.dart';

import '../../../data/static/card_data.dart';

class AppCardsGrid extends StatelessWidget {
  const AppCardsGrid({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.80,
      ),
      itemCount: cardData.length ,
      itemBuilder:
          (BuildContext context, int index) {
        return AppCart(
          titel: cardData[index].titel,
          description:
              cardData[index].description,
          image: cardData[index].image,
          color: cardData[index].color,
          onTap: cardData[index].onTap,
        );
      },
    );
  }
}
