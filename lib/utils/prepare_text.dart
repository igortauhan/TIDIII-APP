import 'package:flutter/material.dart';

class PrepareText {
  Widget prepareDefaultText(String? text) {
    return Text(
      text.toString(),
      style: _prepareTextStyle(),
    );
  }

  Widget prepareDefaultTextAfter(String? text, String? after) {
    return Text(
      text.toString() + after.toString(),
      style: _prepareTextStyle(),
    );
  }

  TextStyle _prepareTextStyle() {
    return const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontFamily: 'Nunito'
    );
  }
}