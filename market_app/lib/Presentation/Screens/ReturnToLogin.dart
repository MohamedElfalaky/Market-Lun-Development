import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import 'package:sizer/sizer.dart';

class ReturnToLogin extends StatelessWidget {
  const ReturnToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: AutoSizeText(
          "Reset Successfully",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      // appBar: AppBar(title: AutoSizeText("LOGIN")),
      body: Container(
        height: Simplify.hightClc(context, 720),
        color: Colors.white,
        child: Column(
          // mainAxisSiz MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: Simplify.hightClc(context, 48),
                  bottom: Simplify.hightClc(context, 48)),
              width: double.infinity,
              // ignore: sort_child_properties_last
              child: Column(
                children: [
                  AutoSizeText(
                    "Successfully Reset",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Simplify.hightClc(context, 16),
                  ),
                  SizedBox(
                    width: Simplify.widthClc(context, 295),
                    child: AutoSizeText(
                      "You Password was Reseted Successfully, tap below to return to login page",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              // color: Color.fromARGB(255, 18, 107, 98),
            ),
            Container(
              // width: double.infinity,
              // ignore: sort_child_properties_last
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Simplify.widthClc(context, 16)),
                width: double.infinity,
                height: Simplify.hightClc(context, 48),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.sp),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login', (Route<dynamic> route) => false);
                    },
                    child: AutoSizeText(
                      'Return to login page',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
