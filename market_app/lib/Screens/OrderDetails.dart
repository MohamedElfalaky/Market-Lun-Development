import 'package:flutter/material.dart';

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
            )),
        body: Container(
          child: ExpansionTile(title: Text("s")),
        ));
  }
}
