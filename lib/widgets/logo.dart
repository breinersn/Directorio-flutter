import 'package:flutter/material.dart';

Widget logo(BuildContext context, double height, double width, double taImg) {
  return Center(
      child: Container(
    width: width * taImg,
    child: Column(
      children: <Widget>[
        Image(image: AssetImage('assets/logo.png')),
      ],
    ),
  ));
}
