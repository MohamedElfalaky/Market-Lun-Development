import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  OrderInfo({super.key});

  Container myOrdertInfo(String metaa, String dataa, context) {
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
          metaa == "Order Status"
              ? Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 222, 255, 220),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      dataa,
                      style: TextStyle(color: Color.fromARGB(255, 66, 255, 94)),
                    ),
                  ),
                )
              : Text(
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
                    myOrdertInfo("Order Status", "In Progress", context),
                    myOrdertInfo("Order ID", "#7363", context),
                    myOrdertInfo("Driver Name", " Khaled Mohamed", context),
                    myOrdertInfo("Order Type", " Delivery", context),
                  ],
                )
              ],
            )
          ]),
    );
    ;
  }
}
