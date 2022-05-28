import 'package:flutter/material.dart';
import 'package:tidiii/application/energy_data_stream.dart';

class EnergyDataComponent extends StatefulWidget {
  const EnergyDataComponent({Key? key}) : super(key: key);

  @override
  State<EnergyDataComponent> createState() => _EnergyDataComponentState();
}

class _EnergyDataComponentState extends State<EnergyDataComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        EnergyDataStream(),
      ],
    );
  }
}
