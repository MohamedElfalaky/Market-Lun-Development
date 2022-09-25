import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/FilterPopUp/PopUpContent.dart';

class FilterPopUp extends StatelessWidget {
  const FilterPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 244, 240),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: MediaQuery.of(context).size.height * 0.06,
            child: Center(
                child: Text(
              'Filter',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ))),
        Padding(
            padding: const EdgeInsets.all(8.0), child: FilterPopUpContent()),
        Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .05,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        TextButton(
          child: Text('Reset all filters'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
