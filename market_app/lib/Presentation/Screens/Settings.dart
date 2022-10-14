import 'package:flutter/material.dart';

import 'package:market_app/Presentation/Widgets/Settings%20Widgets/Inside_Settings.dart';
import 'package:market_app/Presentation/Widgets/Settings%20Widgets/Save_Btn.dart';
import '../../data/Shared/AppLocalizations.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings".tr(context)),
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
