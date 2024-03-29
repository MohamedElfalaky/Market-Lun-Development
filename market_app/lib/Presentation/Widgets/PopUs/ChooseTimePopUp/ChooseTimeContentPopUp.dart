import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class ChooseTimePopUpContent extends StatelessWidget {
  ChooseTimePopUpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.sp),
        child: Column(
          children: [
            Icon(
              Icons.timer,
              color: Colors.orange,
              size: 50.sp,
            ),
            Text(
              "Choose Time".tr(context),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Simplify.hightClc(context, 10),
            ),
            Text(
              " Type time in minutes".tr(context),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: Simplify.hightClc(context, 10),
            ),
          ],
        ));
  }
}
