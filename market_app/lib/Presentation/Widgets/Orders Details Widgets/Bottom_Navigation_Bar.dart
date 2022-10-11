import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/AcceptDeclineWidget.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/CancelButton.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/ViewButton.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final cxt;
  final id;
  final driverName;
  String? status;

  MyBottomNavigationBar(this.status, this.id, this.driverName, this.cxt);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  Widget? statusButton;

  @override
  Widget build(BuildContext context) {
    if (widget.status == "Cancelled" ||
        widget.status == "Delivered" ||
        widget.status == "Refunded") {
      statusButton = null;
    } else if (widget.status == "New") {
      statusButton = AcceptDecline(widget.id);
    } else {
      statusButton = CancelButton(widget.id, widget.driverName, widget.cxt);
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
