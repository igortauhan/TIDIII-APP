import 'package:flutter/material.dart';
import 'package:tidiii/application/energy_data_component.dart';
import 'package:tidiii/application/gradient_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const GradientBackground(someWidget: EnergyDataComponent());
  }
}
