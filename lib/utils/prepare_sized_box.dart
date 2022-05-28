import 'package:flutter/material.dart';
import 'package:tidiii/utils/prepare_text.dart';

class PrepareSizedBox {
  Widget prepareDefaultSizedBoxText(String? string, Color? color) {
    return SizedBox(
      width: 200.0,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: color
        ),
        child: PrepareText()
            .prepareDefaultText(string),
      ),
    );
  }
}