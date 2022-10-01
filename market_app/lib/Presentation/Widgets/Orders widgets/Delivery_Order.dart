import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/AcceptDeclineWidget.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/ViewButton.dart';

class DeliveryOrder extends StatelessWidget {
  int? id;
  String? name;
  String? paymentMethod;
  String? driverName;
  int? total;
  String? status;
  Color? statusColor;
  Color? txtStatusColor;
  Widget? statusButton;
  DeliveryOrder(
      {this.id,
      this.name,
      this.paymentMethod,
      this.driverName,
      this.total,
      this.status});

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
      total.toString(),
    ];
    if (status == "Cancelled") {
      statusColor = Color.fromRGBO(255, 1, 1, 0.2);
      txtStatusColor = Color.fromRGBO(255, 1, 1, 1);
    } else if (status == "Delivered") {
      statusColor = Color.fromRGBO(10, 255, 10, 0.2);
      txtStatusColor = Color.fromRGBO(10, 255, 10, 1);
    } else {
      statusColor = Color.fromARGB(69, 30, 62, 243);
      ;
      txtStatusColor = Color.fromARGB(255, 30, 62, 243);
    }
    ;

    if (status == "Cancelled" ||
        status == "Delivered" ||
        status == "Refunded") {
      statusButton = ViewButton();
    } else {
      statusButton = AcceptDecline();
    }

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/ordersdetails");
      },
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
        child: Card(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(15),
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
                            Icon(Icons.delivery_dining),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "  Delivery Order",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        for (var i = 0; i < metaDeta.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              metaDeta[i],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        // Text("Payment Method"),
                        // Text("Driver Name"),
                        // Text("Total"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: statusColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              status!,
                              style: TextStyle(color: txtStatusColor),
                            ),
                          ),
                        ),
                        for (var i = 0; i < dummyData.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Text(dummyData[i],
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}
