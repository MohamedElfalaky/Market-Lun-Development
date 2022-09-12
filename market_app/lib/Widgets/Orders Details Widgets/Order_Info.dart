import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  OrderInfo({super.key});

  Container myClientInfo(String metaa, String dataa, context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      margin: EdgeInsets.only(bottom: 10, top: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            metaa,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            dataa,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: ExpansionTile(
          title: Row(
            children: [
              Icon(
                Icons.shopping_bag,
                size: 40,
              ),
              Text(
                " Order Info.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          children: [
            Row(
              children: [
                Column(
                  children: [
                    myClientInfo("Client Name", "Mohamed", context),
                    myClientInfo("Phone", "01111238198", context),
                    myClientInfo("Address", "New Maadi", context),
                  ],
                )
              ],
            )
          ]),
    );
    ;
  }
}
