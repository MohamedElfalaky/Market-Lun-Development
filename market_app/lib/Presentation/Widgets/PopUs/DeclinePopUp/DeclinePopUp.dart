import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclineContentPopUp.dart';

class DeclinePopUp extends StatefulWidget {
  const DeclinePopUp({super.key});

  @override
  State<DeclinePopUp> createState() => _DeclinePopUpState();
}

class _DeclinePopUpState extends State<DeclinePopUp> {
  bool _throwShotAway = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: const EdgeInsets.all(8.0), child: DeclineContentPopUp()),

      actions: <Widget>[
        Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(124, 222, 218, 216),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 12.0, left: 18, right: 8),
                  child: TextField(
                    maxLines: 8, //or null
                    decoration: InputDecoration.collapsed(
                        hintText: "Enter your text here"),
                  ),
                ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Checkbox(
                value: _throwShotAway,
                onChanged: (bool? newValue) {
                  setState(() {
                    _throwShotAway = newValue!;
                  });
                },
              ),
              Text("Request for refund?")
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.055,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/orderspage", (route) => false);
                },
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: 70,
        // )
      ],
    );
    ;
  }
}
