import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import 'package:sizer/sizer.dart';

class OneNotification extends StatelessWidget {
  String? body;
  String? date;
  OneNotification({this.body, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: Simplify.hightClc(context, 1),
        left: MediaQuery.of(context).size.height * 0.03,
        right: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 206, 203),
                borderRadius: BorderRadius.circular(10.sp)),
            child: Icon(
              Icons.notifications,
              size: 20.sp,
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: AutoSizeText(
                  body!,
                  // softWrap: true,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                child: AutoSizeText(
                  "${date!}s ago",
                  // softWrap: true,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
