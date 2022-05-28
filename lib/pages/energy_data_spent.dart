import 'package:flutter/material.dart';
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

  Future<int> _getSpentValue() async {
    return EnergyDataService().getCurrentSpentValueMonth(value);
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
                "24 horas por dia ininterruptamente");
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
                PrepareText()
                    .prepareDefaultText('Valor em R\$ aproximadamente mensal: '),
                const SizedBox(
                  height: 5.0,
                ),
                FutureBuilder(
                  future: _getSpentValue(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.data == 0) {
                      return PrepareText()
                          .prepareDefaultText('Error');
                    }

                    return PrepareSizedBox()
                        .prepareDefaultSizedBoxTextButtonTwoTextd(
                          snapshot.data.toString(),
                          ' R\$',
                          Colors.indigo.shade700
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
