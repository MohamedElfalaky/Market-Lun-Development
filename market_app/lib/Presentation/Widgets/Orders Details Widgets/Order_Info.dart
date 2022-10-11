import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';

class OrderInfo extends StatelessWidget {
  String? status;
  String? id;
  String? driverName;
  String? orderType;
  String? time;
  String? updateAt;
  String? hint;

  OrderInfo(
      {this.status,
      this.id,
      this.driverName,
      this.orderType,
      this.time,
      this.updateAt,
      this.hint});

  Color? statusColor;
  Color? txtStatusColor;

  Container myOrdertInfo(
      String metaa, String dataa, Color? stsClr, Color? txtClr, context) {
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
                      color: stsClr, borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      dataa,
                      style: TextStyle(color: txtClr),
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
    if (status == "Cancelled") {
      statusColor = Color.fromRGBO(255, 1, 1, 0.2);
      txtStatusColor = Color.fromRGBO(255, 1, 1, 1);
    } else if (status == "Delivered") {
      statusColor = Color.fromRGBO(10, 255, 10, 0.2);
      txtStatusColor = Color.fromRGBO(10, 255, 10, 1);
    } else if (status == "Refunded") {
      statusColor = Color.fromARGB(69, 30, 62, 243);
      ;
      txtStatusColor = Color.fromARGB(255, 30, 62, 243);
    } else if (status == "New") {
      statusColor = Color.fromARGB(69, 29, 187, 205);
      ;
      txtStatusColor = Color.fromARGB(255, 13, 170, 179);
    } else {
      statusColor = Color.fromARGB(69, 230, 7, 159);
      ;
      txtStatusColor = Color.fromARGB(255, 235, 19, 152);
    }
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    myOrdertInfo("Order Status", status!, statusColor,
                        txtStatusColor, context),
                    myOrdertInfo(
                        "Order ID", id!, statusColor, txtStatusColor, context),
                    myOrdertInfo("Driver Name", driverName!, statusColor,
                        txtStatusColor, context),
                    myOrdertInfo("Order Type", orderType!, statusColor,
                        txtStatusColor, context),
                    myOrdertInfo(
                        "Time", time!, statusColor, txtStatusColor, context),
                    myOrdertInfo("Updated at", updateAt!, statusColor,
                        txtStatusColor, context),
                    myOrdertInfo(
                        "Notes", hint!, statusColor, txtStatusColor, context),
                  ],
                )
              ],
            )
          ]),
    );
    ;
  }
}
