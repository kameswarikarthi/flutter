import 'package:flutter/material.dart';

Widget styledText(
  String text, {
  String? fontName,
  double? fontSize,
  TextAlign? alignment,
}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: fontName,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
    textAlign: alignment,
  );
}
