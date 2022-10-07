import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/AcceptDeclineWidget.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/CancelButton.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/ViewButton.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final id;
  final driverName;
  String? status;
  Widget? statusButton;
  MyBottomNavigationBar(
    this.status,
    this.id,
    this.driverName,
  );
  @override
  Widget build(BuildContext context) {
    if (status == "Cancelled" ||
        status == "Delivered" ||
        status == "Refunded") {
      statusButton = null;
    } else if (status == "New") {
      statusButton = AcceptDecline(id);
    } else {
      statusButton = CancelButton(id, driverName);
    }
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          child: BottomAppBar(child: statusButton)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 20),
        ],
      ),
    );
  }
}
