import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/Presentation/Screens/Orders.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverPopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverPopUpWithTime.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseTimePopUp/ChooseTimePopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclinePopUp.dart';
import 'package:market_app/business_logic/cubits/AssignCubit/Assign_cubit.dart';
import 'package:market_app/business_logic/cubits/New_order_counter/new_order_counter_cubit.dart';
import 'package:market_app/business_logic/cubits/Order_details_cubit/order_details_cubit.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import '../../../data/Shared/AppLocalizations.dart';

class CancelButton extends StatelessWidget {
  final myCtx;
  final id;
  final driverName;
  final int _navigateTothisIndex = 3;
  CancelButton(this.id, this.driverName, this.myCtx);
  void _showAlertDialog(context, Widget myWidget) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return myWidget;
      },
    );
  }

  Widget? assignButton = Container();
  @override
  Widget build(BuildContext context) {
    if (driverName == "Not Assigned") {
      assignButton = Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Driver not assigned yet? ".tr(context),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.022),
              ),
              InkWell(
                onTap: () {
                  _showAlertDialog(context,
                      ChooseDriverPopUpWithTime(id)); // حاطط التايم بصفر
                },
                child: Text(
                  "Assign now".tr(context),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 6, 6)),
                ),
              ),
            ],
          ));
    } else {
      assignButton = Container();
    }
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
                      child: Text(
                        "Time counter".tr(context),
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.023),
                      )),
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
                            state is PreparingToDeliveredSuccess
                                ? () {
                                    OrdersCubit.get(context)
                                            .selectedIndex = //حط شادو علي التاب اللي اتعدل لها الستيت
                                        _navigateTothisIndex;

                                    OrdersCubit.get(context).getOrders(
                                        //
                                        // رندر الاوردر ليست
                                        delivery: 1,
                                        pickup: 1,
                                        status: 5,
                                        apiToken:
                                            CacheHelper.getFromShared("token"));

                                    // to update "New" Counter and tab bar (change the selected index)
                                    NewOrderCounterCubit.get(context).getOrders(
                                        apiToken:
                                            CacheHelper.getFromShared("token"));

                                    //render order details..
                                    TestCubit.get(context).getOrdersDetails(
                                        apiToken:
                                            CacheHelper.getFromShared("token"),
                                        orderId: id.toString());

                                    // BlocProvider.of<TestCubit>(context)
                                    //     .getOrdersDetails(
                                    //         apiToken: CacheHelper.getFromShared(
                                    //             "token"),
                                    //         orderId: id.toString());
                                  }()
                                : null;
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
                                                  orderId: id);
                                        },
                                        child: Text("Delivered".tr(context)),
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
                                            child:
                                                Text("Delivered".tr(context)),
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
                            child: Text("Cancel".tr(context)),
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
              BlocConsumer<AssignCubit, AssignState>(
                listener: (context, state) {
                  if (state is AssignSuccess) {
                    if (state.myOrderDetailsModel.data.driverName ==
                        "Not Assigned") {
                      assignButton = Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Driver not assigned yet? ".tr(context)),
                              InkWell(
                                onTap: () {
                                  _showAlertDialog(
                                      context,
                                      ChooseDriverPopUpWithTime(
                                          id)); // حاطط التايم بصفر
                                },
                                child: Text(
                                  "Assign now".tr(context),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 247, 6, 6)),
                                ),
                              ),
                            ],
                          ));
                    } else {
                      assignButton = Container();
                    }
                  }
                },
                builder: (context, state) {
                  return state is! AssignLoading
                      ? assignButton!
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
