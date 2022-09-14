import 'package:flutter/material.dart';
import 'package:market_app/Widgets/PopUs/FilterPopUp/Filter_PopUp.dart';

class HorizontalFilterBar extends StatelessWidget {
  const HorizontalFilterBar({super.key});
  static const List<String> _barMetaData = [
    "New",
    "Preparing",
    "Recived",
    "Completed",
    "All"
  ];

  void _showAlertDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FilterPopUp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(right: 12, left: 20, top: 15, bottom: 10),
            // height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.75,
            child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: [
                  for (var i = 0; i < _barMetaData.length; i++)
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Center(
                            child: Text(
                          _barMetaData[i],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        // height: 50,
                        width: 110.0,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 229, 228),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                ]),
          ),
          InkWell(
            onTap: () {
              _showAlertDialog(context);
            },
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.1,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 231, 229, 228)),
              child: Image.asset("assets/filter.png"),
            ),
          )
        ],
      ),
    );
  }
}
