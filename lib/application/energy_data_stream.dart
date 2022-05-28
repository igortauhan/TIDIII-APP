import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tidiii/models/energy_data.dart';
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

        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PrepareText().prepareDefaultText('Gasto atual em Ampères: '),
              PrepareText().prepareDefaultTextAfter(snapshot.data?.value.toString(), 'A'),
            ],
          )
        );
      }
    );
  }
}
