import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverContentPopUp.dart';

class ChooseDriverPopUp extends StatefulWidget {
  const ChooseDriverPopUp({super.key});

  @override
  State<ChooseDriverPopUp> createState() => _ChooseDriverPopUpState();
}

class _ChooseDriverPopUpState extends State<ChooseDriverPopUp> {
  static const List<String> Driverslist = <String>[
    'One',
    'Two',
    'Three',
    'Four'
  ];
  String dropdownValue = Driverslist.first;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChooseDriverPopUpContent()),

      actions: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.only(left: 20, right: 15),
          decoration: BoxDecoration(
              color: Color.fromARGB(126, 217, 205, 204),
              borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width * .8,
          child: DropdownButton<String>(
            isExpanded: true,
            borderRadius: BorderRadius.circular(20),
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
            ),
            elevation: 16,
            // style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: Driverslist.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.23,
              height: MediaQuery.of(context).size.height * 0.05,
              child: OutlinedButton(
                child: Text('Later'),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/orderspage", (route) => false);
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/orderspage", (route) => false);
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
    ;
  }
}
