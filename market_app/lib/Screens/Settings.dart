import 'package:flutter/material.dart';
import 'package:market_app/Widgets/Orders%20Details%20Widgets/AcceptDeclineWidget.dart';
import 'package:market_app/Widgets/Orders%20Details%20Widgets/Billing_Info.dart';
import 'package:market_app/Widgets/Orders%20Details%20Widgets/Client_info.dart';
import 'package:market_app/Widgets/Orders%20Details%20Widgets/Order_Info.dart';
import 'package:market_app/Widgets/Search%20widget/Search.dart';
import 'package:market_app/Widgets/Settings%20Widgets/Inside_Settings.dart';
import 'package:market_app/Widgets/Settings%20Widgets/Save_Btn.dart';

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
