import 'package:flutter/material.dart';
import 'package:market_app/Widgets/Orders%20Details%20Widgets/Billing_Info.dart';
import 'package:market_app/Widgets/Orders%20Details%20Widgets/Client_info.dart';
import 'package:market_app/Widgets/Orders%20Details%20Widgets/Order_Info.dart';
import 'package:market_app/Widgets/Search%20widget/Search.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.pop(context);
            }),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: mySearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: ListView(children: [ClientInfo(), OrderInfo(), BillingInfo()]));
  }
}
