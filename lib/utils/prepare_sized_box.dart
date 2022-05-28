import 'package:flutter/material.dart';
import 'package:tidiii/utils/prepare_text.dart';

class PrepareSizedBox {
  Widget prepareDefaultSizedBoxTextButton(String? string, Color? color) {
    return SizedBox(
      width: 200.0,
      height: 40.0,
      child: _prepareElevatedButton(string, color),
    );
  }

  Widget prepareDefaultSizedBoxTextButtonTwoTextd(String? stringOne,
                                                  String? stringTwo,
                                                  Color? color) {
    return SizedBox(
      width: 200.0,
      height: 40.0,
      child: _prepareElevatedButtonTwoTexts(stringOne, stringTwo, color),
    );
  }

  ElevatedButton _prepareElevatedButtonTwoTexts(String? stringOne,
                                                String? stringTwo,
                                                Color? color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: color
      ),
      child: PrepareText()
          .prepareDefaultTextAfter(stringOne, stringTwo),
    );
  }

  ElevatedButton _prepareElevatedButton(String? string, Color? color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: color
      ),
      child: PrepareText()
          .prepareDefaultText(string),
    );
  }
}