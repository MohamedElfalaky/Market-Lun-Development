import 'package:flutter/material.dart';

class BillingInfo extends StatelessWidget {
  BillingInfo({super.key});

  Container myBillInfo(String metaa, String dataa, context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      margin: EdgeInsets.only(bottom: 10, top: 5),
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
                Icons.attach_money_rounded,
                size: 40,
              ),
              Text(
                " Billing Info.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          children: [
            Row(
              children: [
                Column(
                  children: [
                    myBillInfo("Payment Method", "Visa", context),
                    myBillInfo("Subtotal", "155.00 \$", context),
                    myBillInfo("Delivery fees", "5.00 \$", context),
                  ],
                )
              ],
            )
          ]),
    );
    ;
  }
}
