import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/AcceptDeclineWidget.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/CancelButton.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/ViewButton.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class DeliveryOrder extends StatelessWidget {
  int? id;
  String? name;
  String? paymentMethod;
  String? driverName;
  num? total;
  String? status;
  String? receiveMethod;
  Color? statusColor;
  Color? txtStatusColor;
  Widget? statusButton;
  Icon? methodIcon;
  String? time;
  final expiration;
  final timeZone;
  DeliveryOrder(
      {this.id,
      this.name,
      this.paymentMethod,
      this.driverName,
      this.total,
      this.status,
      this.receiveMethod,
      required this.time,
      required this.expiration,
      required this.timeZone});

  List<String> metaDeta = [
    "Order ID",
    "Client Name",
    "Payment Method",
    "Driver Name",
    "Total"
  ];

  // if(status== "s"){
  //   statusColor= Color.fromARGB(253, 239, 38, 0);
  // }

  @override
  Widget build(BuildContext context) {
    List<String> dummyData = [
      id.toString(),
      name.toString(),
      paymentMethod.toString(),
      driverName.toString(),
      "${total.toString()} \u0024",
    ];
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
    ;

    if (status == "Cancelled" ||
        status == "Delivered" ||
        status == "Refunded") {
      statusButton = ViewButton();
    } else if (status == "New") {
      statusButton = AcceptDecline(id, expiration, timeZone);
    } else {
      statusButton = CancelButton(id, driverName, context, time, timeZone);
    }

    if (receiveMethod == "Delivery") {
      methodIcon = Icon(
        Icons.delivery_dining,
        size: 40,
      );
    } else {
      methodIcon = Icon(
        Icons.assured_workload,
        size: 40,
      );
    }

    return Container(
      margin: EdgeInsets.only(
          right: Simplify.widthClc(context, 16),
          left: Simplify.widthClc(context, 16),
          bottom: Simplify.hightClc(context, 16)),
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Simplify.hightClc(context, 12),
              horizontal: Simplify.widthClc(context, 16)),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          methodIcon!,
                          SizedBox(
                            width: Simplify.widthClc(context, 8),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: AutoSizeText(
                                receiveMethod!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              )),
                        ],
                      ),
                      for (var i = 0; i < metaDeta.length; i++)
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: Simplify.hightClc(context, 6)),
                          child: AutoSizeText(
                            metaDeta[i].tr(context),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      // AutoSizeText("Payment Method"),
                      // AutoSizeText("Driver Name"),
                      // AutoSizeText("Total"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: Simplify.hightClc(context, 5)),
                        height: Simplify.hightClc(context, 30),
                        width: Simplify.widthClc(context, 100),
                        decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: Center(
                          child: AutoSizeText(
                            status!,
                            style:
                                TextStyle(color: txtStatusColor, fontSize: 14),
                          ),
                        ),
                      ),
                      for (var i = 0; i < dummyData.length; i++)
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: Simplify.hightClc(context, 8)),
                          child: AutoSizeText(dummyData[i],
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF999999))),
                        ),
                    ],
                  )
                ],
              ),
              statusButton!
            ],
          ),
        ),
      ),
    );
  }
}
