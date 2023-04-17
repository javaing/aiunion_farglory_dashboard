import 'dart:ui';
import 'package:flutter/cupertino.dart';

Widget smallCircle(Color cc) {
  return Container(
    height: 8.0,
    width: 8.0,
    decoration: BoxDecoration(
      color: cc,
      shape: BoxShape.circle,
    ),
    margin: const EdgeInsets.only(top: 15.0, right: 15.0),
  );
}

Widget colorText(String txt, double size, Color cc) {
  return Center(child: Text(txt,
    style: TextStyle(
      fontSize: size,
      color: cc,
    ),));
}