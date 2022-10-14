import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';
import '../../../../data/Shared/AppLocalizations.dart';

class DeclineContentPopUp extends StatelessWidget {
  DeclineContentPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Icon(
              Icons.dangerous_rounded,
              color: Colors.orange,
              size: 70,
            ),
            Text(
              "Cancel Order :(".tr(context),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Type reason for cancelation".tr(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
