import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/Billing_Info.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/Bottom_Navigation_Bar.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/Client_info.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/Order_Info.dart';
import 'package:market_app/Presentation/Widgets/Search%20widget/Search.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';

class OrderDetails extends StatefulWidget {
  final int? id;
  final String? status;
  // Color? statusColor;
  // Color? txtStatusColor;
  OrderDetails({this.id, this.status});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  void initState() {
    OrderDetailsCubit.get(context).getDetails(
        apiToken: CacheHelper.getFromShared("token"),
        orderId: widget.id.toString());
    super.initState();
  }

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
                  Navigator.pushNamed(context, '/search');
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: ListView(children: [
          ClientInfo(),
          OrderInfo(widget.status),
          BillingInfo(),
        ]),
        bottomNavigationBar: MyBottomNavigationBar(widget.status));
  }
}
