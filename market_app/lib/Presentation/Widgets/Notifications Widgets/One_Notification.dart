import 'package:flutter/material.dart';

class OneNotification extends StatelessWidget {
  String? body;
  String? date;
  OneNotification({this.body, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      padding: EdgeInsets.only(top: 35),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 206, 203),
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.notifications,
              size: 40,
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
                child: Text(
                  body!,
                  // softWrap: true,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                child: Text(
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
