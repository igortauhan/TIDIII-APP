import 'package:flutter/material.dart';

import '../utils/prepare_text.dart';

class DefaultDrawer extends StatefulWidget {
  const DefaultDrawer({Key? key}) : super(key: key);

  @override
  State<DefaultDrawer> createState() => _DefaultDrawerState();
}

class _DefaultDrawerState extends State<DefaultDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurpleAccent,
      child: ListView(
        children: [
          SizedBox(
            height: 80.0,
            child: DrawerHeader(
              child: PrepareText().prepareDefaultText('Menu'),
            ),
          ),
          ListTile(
            title: PrepareText().prepareDefaultText('Calcular valor mensal'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
