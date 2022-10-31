import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

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
              size: 50.sp,
            ),
            Text(
              "Cancel Order :(".tr(context),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Simplify.hightClc(context, 10),
            ),
            Text(
              " Type reason for cancelation".tr(context),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: Simplify.hightClc(context, 20),
            ),
          ],
        ));
  }
}
