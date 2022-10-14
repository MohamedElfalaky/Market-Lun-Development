import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:duration_picker/duration_picker.dart';
import '../../../../data/Shared/AppLocalizations.dart';

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
              "Choose Time".tr(context),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Type time in minutes".tr(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
