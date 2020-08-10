import 'package:flutter/cupertino.dart';

class CustomFont extends StatelessWidget {
  final inputText, fontSize, fontType;
  final fontWeight;
  final color;

  CustomFont(
      {this.inputText,
      this.fontSize,
      this.fontType,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      maxLines: 3,
      style: TextStyle(
          fontFamily: fontType,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
      ),
    );
  }
}
