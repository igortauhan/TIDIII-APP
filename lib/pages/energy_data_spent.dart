import 'package:flutter/material.dart';
import 'package:tidiii/application/energy_data_future.dart';
import 'package:tidiii/application/gradient_background.dart';
import 'package:tidiii/services/energy_data_service.dart';
import 'package:tidiii/utils/prepare_sized_box.dart';
import 'package:tidiii/utils/prepare_text.dart';

class EnergyDataSpent extends StatefulWidget {
  final int? value;
  const EnergyDataSpent({Key? key, required this.value}) : super(key: key);

  @override
  State<EnergyDataSpent> createState() => _EnergyDataSpentState();
}

class _EnergyDataSpentState extends State<EnergyDataSpent> {
  int? value;

  Future<List<int>> _getSpentValue() async {
    int valueSpent;
    List<int> values = [];

    valueSpent = await EnergyDataService().getCurrentSpentValueByDays(value, 30);
    values.add(valueSpent);

    valueSpent = await EnergyDataService().getCurrentSpentValueByDays(value, 7);
    values.add(valueSpent);
    return values;
  }

  _showAlertDialog(BuildContext context,
      String? title, String? content) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title.toString()),
      content: Text(content.toString()),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
          onPressed: () {
            _showAlertDialog(context,
                "Como funciona o calculo do valor?",
                "O valor é calculado baseado no uso do produto "
                "24 horas por dia ininterruptamente.\n\n"
                "O valor mensal é calculado com 30 dias corridos.\n\n"
                "O valor semanal é calculado com 7 dias corridos.\n\n"
                "O valor é aproximado e não é levado em conta as taxas "
                "das bandeiras.");
          },
          icon: const Icon(Icons.help),
        ),
      ),
      body: GradientBackground(
          someWidget: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<List<int>>(
                  future: _getSpentValue(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.connectionState == ConnectionState.waiting
                    ) {
                      return const CircularProgressIndicator();
                    }

                    return Column(
                      children: [
                        EnergyDataFuture(
                          text: 'Valor em R\$ aproximadamente mensal: ',
                          value: snapshot.data?.elementAt(0),
                        ),
                        const SizedBox(
                          height: 100.0,
                        ),
                        EnergyDataFuture(
                          text: 'Valor em R\$ aproximadamente semanal: ',
                          value: snapshot.data?.elementAt(1),
                        ),
                    ]
                    );
                  }
                ),
              ],
            ),
          ),
          highColor: Colors.indigo.shade700,
          lowColor: Colors.indigo.shade400),
    );
  }
}
