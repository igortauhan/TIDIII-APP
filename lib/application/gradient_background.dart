import 'package:flutter/material.dart';

class GradientBackground extends StatefulWidget {
  final Widget someWidget;
  final Color highColor;
  final Color lowColor;

  const GradientBackground({Key? key, required this.someWidget,
      required this.highColor, required this.lowColor}) : super(key: key);

  @override
  State<GradientBackground> createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground> {
  late final Widget someWidget;
  late final Color highColor;
  late final Color lowColor;

  @override
  void initState() {
    someWidget = widget.someWidget;
    highColor = widget.highColor;
    lowColor = widget.lowColor;
  }

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
                highColor,
                lowColor
              ]
          )
      ),
      child: Center(
        child: someWidget,
      ),
    );
  }
}
