import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:duration_picker/duration_picker.dart';

class ChooseTimePopUpContent extends StatelessWidget {
  ChooseTimePopUpContent({super.key});

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
              " Type time in minutes",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
