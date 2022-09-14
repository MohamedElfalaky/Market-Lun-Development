import 'package:flutter/material.dart';

class ChooseTimePopUpContent extends StatefulWidget {
  ChooseTimePopUpContent({super.key});

  @override
  State<ChooseTimePopUpContent> createState() => _ChooseTimePopUpContentState();
}

class _ChooseTimePopUpContentState extends State<ChooseTimePopUpContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Icon(
              Icons.timer,
              color: Colors.orange,
              size: 50,
            ),
            Text(
              "Choose Time",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Select which driver you want toassign to \this order",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
