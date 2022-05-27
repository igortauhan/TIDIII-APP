import 'package:flutter/material.dart';
import 'package:tidiii/application/energy_data_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade700,
                Colors.deepPurple.shade300
              ]
          )
      ),
      child: const Center(
        child: EnergyDataComponent(),
      ),
    );
  }
}
