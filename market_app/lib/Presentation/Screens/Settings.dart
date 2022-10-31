import 'package:auto_size_text/auto_size_text.dart';
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
          title: AutoSizeText("Settings".tr(context)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.pop(context);
            }),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView(children: [
            insideSettings(),
          ]),
        ),
        bottomNavigationBar: SaveBtn());
  }
}
