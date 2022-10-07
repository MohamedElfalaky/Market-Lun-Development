import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Screens/Orders.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverPopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverPopUpWithTime.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseTimePopUp/ChooseTimePopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclinePopUp.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';

class CancelButton extends StatelessWidget {
  final id;
  final driverName;
  final int _navigateTothisIndex = 3;
  CancelButton(
    this.id,
    this.driverName,
  );
  void _showAlertDialog(context, Widget myWidget) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return myWidget;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/cooking.gif")),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Order will be ready in x mins")),
                ],
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
                          listener: (context, state) {
                            // state is UpdateOrderSuccess
                            //     ? Navigator.pushAndRemoveUntil(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => OrdersPage(
                            //                   statusToinitiate:
                            //                       _navigateTothisIndex,
                            //                 )),
                            //         ModalRoute.withName(""))
                            //     : null;
                          },
                          builder: (context, state) {
                            return state is! UpdateOrderLoading
                                ? SizedBox(
                                    height: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          UpdateOrderCubit.get(context)
                                              .updatePreparingToDelivered(
                                            orderId: id,
                                          );

                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrdersPage(
                                                        statusToinitiate:
                                                            _navigateTothisIndex,
                                                      )),
                                              ModalRoute.withName(""));
                                          OrdersCubit.get(context)
                                                  .selectedIndex =
                                              _navigateTothisIndex;
                                        },
                                        child: Text("Delivered"),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                255, 60, 238, 60)),
                                      ),
                                    ),
                                  )
                                : id == UpdateOrderCubit.get(context).currentId
                                    // من الكيوبت عشان اعرف امسكها بعد ما تاخد قيمتها
                                    ? Center(child: CircularProgressIndicator())
                                    : SizedBox(
                                        height: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text("Delivered"),
                                            style: ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 60, 238, 60)),
                                          ),
                                        ),
                                      );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          height: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              _showAlertDialog(context, DeclinePopUp(id));
                            },
                            child: Text("Cancel"),
                            style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 245, 243, 243),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                side: BorderSide(color: Colors.red),
                                primary: Color.fromARGB(255, 246, 19, 19)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              driverName == "Not Assigned"
                  ? Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Driver not assigned yet? "),
                          InkWell(
                            onTap: () {
                              _showAlertDialog(
                                  context,
                                  ChooseDriverPopUpWithTime(
                                      id)); // حاطط التايم بصفر
                            },
                            child: Text(
                              "Assign now",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 247, 6, 6)),
                            ),
                          ),
                        ],
                      ))
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
