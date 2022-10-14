import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';
import '../../../../data/Shared/AppLocalizations.dart';

class ChooseDriverPopUpContent extends StatelessWidget {
  ChooseDriverPopUpContent({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Icon(
              Icons.delivery_dining,
              color: Colors.orange,
              size: 70,
            ),
            Text(
              "Choose Driver".tr(context),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Select which driver".tr(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
