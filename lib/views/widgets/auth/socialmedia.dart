import 'package:flutter/material.dart';

class AppSocialMadiaSignIN
    extends StatelessWidget {
  final String imUrl;
  final void Function() onTap;
  const AppSocialMadiaSignIN(
      {Key? key,
      required this.imUrl,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width:40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75),
          image: DecorationImage(
            image: AssetImage(imUrl),
          ),
        ),
      ),
    );
  }
}
