import 'package:flutter/material.dart';

import '../utils/prepare_sized_box.dart';
import '../utils/prepare_text.dart';

class EnergyDataFuture extends StatefulWidget {
  final String? text;
  final int? value;

  const EnergyDataFuture({Key? key,
    required this.text,
    required this.value
  }) : super(key: key);

  @override
  State<EnergyDataFuture> createState() => _EnergyDataFutureState();
}

class _EnergyDataFutureState extends State<EnergyDataFuture> {
  String? text;
  int? value;

  @override
  void initState() {
    text = widget.text;
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrepareText()
            .prepareDefaultText(text),
        const SizedBox(
          height: 5.0,
        ),
        PrepareSizedBox()
            .prepareDefaultSizedBoxTextButtonTwoTextd(
            value.toString(),
            ' R\$',
            Colors.indigo.shade700
        ),
      ],
    );
  }
}
