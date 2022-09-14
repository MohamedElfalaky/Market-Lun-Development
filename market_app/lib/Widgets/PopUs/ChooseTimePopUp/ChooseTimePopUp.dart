import 'package:flutter/material.dart';
import 'package:market_app/Widgets/PopUs/ChooseTimePopUp/PopUpContent.dart';
import 'package:market_app/Widgets/PopUs/FilterPopUp/PopUpContent.dart';

class ChoosTimePopUp extends StatelessWidget {
  const ChoosTimePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: const EdgeInsets.all(8.0), child: ChooseTimePopUpContent()),
      actions: <Widget>[
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
    ;
  }
}
