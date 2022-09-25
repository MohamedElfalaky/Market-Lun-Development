import 'package:flutter/material.dart';

import 'package:market_app/Presentation/Widgets/Settings%20Widgets/Inside_Settings.dart';
import 'package:market_app/Presentation/Widgets/Settings%20Widgets/Save_Btn.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.pop(context);
            }),
          ),
        ),
        body: ListView(children: [
          insideSettings(),
        ]),
        bottomNavigationBar: SaveBtn());
  }
}
