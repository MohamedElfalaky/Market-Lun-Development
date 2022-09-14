import 'package:flutter/material.dart';
import 'package:market_app/Widgets/Orders%20widgets/Delivery_Order.dart';
import 'package:market_app/Widgets/Orders%20widgets/Horizontal_filter_bar.dart';
import 'package:market_app/Widgets/Orders%20widgets/Navigation_Drawer%20_Widget.dart';
import 'package:market_app/Widgets/Search%20widget/Search.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Orders"),
        // iconTheme: IconThemeData(color: Colors.red),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: mySearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
        // bottom: HorizontalFilterBar(),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: Column(
                  children: [
                    HorizontalFilterBar(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView(
                        children: [
                          DeliveryOrder(),
                          DeliveryOrder(),
                          DeliveryOrder()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
