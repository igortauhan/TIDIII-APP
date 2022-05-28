import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tidiii/models/energy_data.dart';
import 'package:tidiii/pages/energy_data_spent.dart';
import 'package:tidiii/utils/prepare_text.dart';

import '../services/energy_data_service.dart';

class EnergyDataStream extends StatefulWidget {
  const EnergyDataStream({Key? key}) : super(key: key);

  @override
  State<EnergyDataStream> createState() => _EnergyDataStreamState();
}

class _EnergyDataStreamState extends State<EnergyDataStream> {

  late final StreamController<EnergyData> _streamController =
      StreamController();

  void _setControllerData() async {
    EnergyData energyData = await EnergyDataService().findAll();
    _streamController.sink.add(energyData);
  }

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      _setControllerData();
    });
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EnergyData>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrepareText().prepareDefaultText('Gasto atual em Watts: '),
                PrepareText().prepareDefaultTextAfter(snapshot.data?.value.toString(), 'W'),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 200.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        EnergyDataSpent(value: snapshot.data?.value)));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent.shade700
                ),
                child: PrepareText().prepareDefaultText('Calcular em R\$'),
              ),
            ),
          ]
        );
      }
    );
  }
}
