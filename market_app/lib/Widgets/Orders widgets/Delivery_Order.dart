import 'package:flutter/material.dart';

class DeliveryOrder extends StatelessWidget {
  DeliveryOrder({super.key});

  List<String> metaDeta = [
    "Order ID",
    "Client Name",
    "Payment Method",
    "Driver Name",
    "Total"
  ];

  List<String> dummyData = [
    "dummy id",
    "dummy name",
    "dummy payment",
    "dymmy driver",
    "dymmy cost",
  ];
  @override
  Widget build(BuildContext context) {
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
                              color: Color.fromARGB(255, 192, 215, 255),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "New",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            child: Image.asset("assets/200w.gif")),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Text("Order will canceled in x mins")),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SizedBox(
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Accept"),
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 60, 238, 60)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text("Decline"),
                                style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 245, 240, 240),
                                    side:
                                        BorderSide(color: Colors.red, width: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
