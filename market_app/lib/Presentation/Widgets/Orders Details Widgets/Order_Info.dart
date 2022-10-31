import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

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
      padding: EdgeInsets.only(left: Simplify.widthClc(context, 10)),
      margin: EdgeInsets.symmetric(vertical: Simplify.hightClc(context, 8)),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            metaa,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          metaa == "Order Status".tr(context)
              ? Container(
                  height: Simplify.hightClc(context, 30),
                  width: Simplify.widthClc(context, 100),
                  decoration: BoxDecoration(
                      color: stsClr,
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: Center(
                    child: AutoSizeText(
                      dataa,
                      style: TextStyle(color: txtClr, fontSize: 14),
                    ),
                  ),
                )
              : AutoSizeText(
                  dataa,
                  style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
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
      color: Colors.white,
      // margin: EdgeInsets.symmetric(vertical: 15),
      child: ExpansionTile(
          title: Row(
            children: [
              Icon(
                Icons.shopping_bag,
                size: 40,
              ),
              AutoSizeText(
                "Order Info".tr(context),
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
                    myOrdertInfo("Order Status".tr(context), status!,
                        statusColor, txtStatusColor, context),
                    myOrdertInfo("Order ID".tr(context), id!, statusColor,
                        txtStatusColor, context),
                    myOrdertInfo("Driver Name".tr(context), driverName!,
                        statusColor, txtStatusColor, context),
                    myOrdertInfo("Order Type".tr(context), orderType!,
                        statusColor, txtStatusColor, context),
                    myOrdertInfo("Time".tr(context), time!, statusColor,
                        txtStatusColor, context),
                    myOrdertInfo("Updated at".tr(context), updateAt!,
                        statusColor, txtStatusColor, context),
                    myOrdertInfo("Notes".tr(context), hint!, statusColor,
                        txtStatusColor, context),
                  ],
                )
              ],
            )
          ]),
    );
    ;
  }
}
