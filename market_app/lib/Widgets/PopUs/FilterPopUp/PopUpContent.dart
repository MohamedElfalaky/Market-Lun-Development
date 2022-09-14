import 'package:flutter/material.dart';

class FilterPopUpContent extends StatefulWidget {
  FilterPopUpContent({super.key});

  @override
  State<FilterPopUpContent> createState() => _FilterPopUpContentState();
}

class _FilterPopUpContentState extends State<FilterPopUpContent> {
  static const List<String> values1 = ["All", "Pick up", "Delivery"];
  static const List<String> values2 = [
    "Today",
    "Yesterday",
    "Lastweek",
    "Lastmonth"
  ];
  String selectedValue1 = values1.first;
  String selectedValue2 = values2.first;

  Widget myFilterPopUp(List myList, int index, context) {
    return Container(
      // padding: EdgeInsets.only(left: 10),
      // margin: EdgeInsets.only(bottom: 10, top: 5),
      width: MediaQuery.of(context).size.width * 1,
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
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Column(children: [
            Row(
              children: [
                SizedBox(height: 30, child: Icon(Icons.shopping_bag)),
                Text(
                  "  Order status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),

            myFilterPopUp(values1, 0, context),
            // myFilterPopUp(values2, selectedValue2, context)
          ]),
          Column(children: [
            Row(
              children: [
                SizedBox(height: 30, child: Icon(Icons.date_range)),
                Text(
                  "  Date",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),

            myFilterPopUp(values2, 1, context),
            // myFilterPopUp(values2, selectedValue2, context)
          ])
        ],
      ),
    );
    ;
  }
}
