import 'package:flutter/material.dart';

class insideSettings extends StatefulWidget {
  insideSettings({super.key});

  @override
  State<insideSettings> createState() => _insideSettingsState();
}

class _insideSettingsState extends State<insideSettings> {
  static const List<String> values1 = ["Available", "Busy", "Closed"];
  static const List<String> values2 = ["Delivery", "Pickup"];
  String selectedValue1 = values1.first;
  String selectedValue2 = values2.first;

  Widget myinsideSettings(List myList, int index, context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(bottom: 10, top: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: myList.map((listItem) {
          return RadioListTile<String>(
            value: listItem,
            groupValue: index == 0 ? selectedValue1 : selectedValue2,
            title: Text(listItem,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            onChanged: ((value) {
              setState(() {
                listItem = value!;
                if (index == 0) {
                  selectedValue1 = value;
                } else {
                  selectedValue2 = value;
                }
                print(listItem);
                //  print(myselected);
                print(value);
              });
            }),
          );
        }).toList()

        // Text(
        //   metaa,
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        // ),
        // Text(
        //   dataa,
        //   style: TextStyle(fontSize: 15),
        // )
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          ExpansionTile(
              title: Row(
                children: [
                  SizedBox(height: 30, child: Image.asset("assets/market.png")),
                  Text(
                    "  Market status.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              children: [
                myinsideSettings(values1, 0, context),
                // myinsideSettings(values2, selectedValue2, context)
              ]),
          ExpansionTile(
              title: Row(
                children: [
                  SizedBox(height: 30, child: Image.asset("assets/qq.png")),
                  Text(
                    "  Recive method",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              children: [
                myinsideSettings(values2, 1, context),
                // myinsideSettings(values2, selectedValue2, context)
              ])
        ],
      ),
    );
    ;
  }
}
