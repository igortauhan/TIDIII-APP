import 'package:flutter/material.dart';

class PrepareText {
  Widget prepareDefaultText(String? text) {
    return Text(
      text.toString(),
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontFamily: 'Nunito'
      ),
    );
  }

  Widget prepareDefaultTextAfter(String? text, String after) {
    return Text(
      text.toString() + after,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontFamily: 'Nunito'
      ),
    );
  }
}