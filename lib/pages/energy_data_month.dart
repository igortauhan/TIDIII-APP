import 'package:flutter/material.dart';
import 'package:tidiii/application/gradient_background.dart';
import 'package:tidiii/utils/prepare_text.dart';

class EnergyDataMonth extends StatefulWidget {
  final int? value;
  const EnergyDataMonth({Key? key, required this.value}) : super(key: key);

  @override
  State<EnergyDataMonth> createState() => _EnergyDataMonthState();
}

class _EnergyDataMonthState extends State<EnergyDataMonth> {
  int? value;

  @override
  void initState() {
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          someWidget: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrepareText()
                    .prepareDefaultText('Valor em R\$ aproximadamente mensal: '),
                const SizedBox(
                  height: 5.0,
                ),
                PrepareText()
                    .prepareDefaultTextAfter('$value', 'R\$'),
              ],
            ),
      )),
    );
  }
}
