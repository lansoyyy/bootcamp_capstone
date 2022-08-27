import 'package:flutter/material.dart';

class TextBold extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const TextBold(
      {Key? key,
      required this.text,
      required this.color,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'QBold',
        color: color,
        fontSize: fontSize,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class TextRegular extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const TextRegular(
      {Key? key,
      required this.text,
      required this.color,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'QRegular',
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
