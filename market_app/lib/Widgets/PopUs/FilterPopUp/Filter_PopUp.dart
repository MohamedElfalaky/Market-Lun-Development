import 'package:flutter/material.dart';
import 'package:market_app/Widgets/PopUs/FilterPopUp/PopUpContent.dart';

class FilterPopUp extends StatelessWidget {
  const FilterPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('Filter'),
      content: Padding(
          padding: const EdgeInsets.all(8.0), child: FilterPopUpContent()),
      actions: <Widget>[
        TextButton(
          child: Text('Save'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Reset all filters'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    ;
  }
}
