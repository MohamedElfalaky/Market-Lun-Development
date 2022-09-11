import 'package:flutter/material.dart';
import 'package:market_app/Widgets/Orders%20widgets/Horizontal_filter_bar.dart';
import 'package:market_app/Widgets/Orders%20widgets/Navigation_Drawer%20_Widget.dart';

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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HorizontalFilterBar(),
        ],
      ),
    );
  }
}
