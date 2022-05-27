import 'package:flutter/material.dart';

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
      children: [
        Container(
          child: Text(
            'Gasto atual em Amperes: 30A',
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Nunito',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
