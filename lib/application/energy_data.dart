import 'package:flutter/material.dart';

class EnergyData extends StatefulWidget {
  const EnergyData({Key? key}) : super(key: key);

  @override
  State<EnergyData> createState() => _EnergyDataState();
}

class _EnergyDataState extends State<EnergyData> {
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
