import 'package:flutter/material.dart';

class GradientBackground extends StatefulWidget {
  final Widget someWidget;

  const GradientBackground({Key? key, required this.someWidget}) : super(key: key);

  @override
  State<GradientBackground> createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground> {
  late final Widget someWidget;

  @override
  void initState() {
    someWidget = widget.someWidget;
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
                Colors.deepPurple.shade700,
                Colors.deepPurple.shade300
              ]
          )
      ),
      child: Center(
        child: someWidget,
      ),
    );
  }
}
