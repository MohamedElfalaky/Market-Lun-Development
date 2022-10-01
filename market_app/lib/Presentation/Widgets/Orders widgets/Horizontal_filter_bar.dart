import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/PopUs/FilterPopUp/Filter_PopUp.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';

class HorizontalFilterBar extends StatelessWidget {
  HorizontalFilterBar({super.key});
  static const List<String> _barMetaData = [
    "All",
    "New",
    "Preparing",
    "Delivered", //5
    "Canceled", //6
    "Refunded", //7
  ];

  void _showModalSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: ((context) => FilterPopUp()));
  }

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    // if (flag == true) {
    //   txtColor = Colors.amber;
    // } else {
    //   txtColor = Colors.red;
    // }
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin:
                    EdgeInsets.only(right: 12, left: 20, top: 15, bottom: 10),
                // height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.75,
                child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i = 0; i < _barMetaData.length; i++)
                        InkWell(
                          onTap: () {
                            if (OrdersCubit.selectedValue1 == "All") {
                              if (i == 0) {
                                OrdersCubit.get(context).getAllOrders(
                                    delivery: 1,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"));
                              } else if (i == 3) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 5);
                              } else if (i == 4) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 6);
                              } else if (i == 5) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 7);
                              }
                            } else if (OrdersCubit.selectedValue1 ==
                                "Delivery") {
                              if (i == 0) {
                                OrdersCubit.get(context).getAllOrders(
                                    delivery: 1,
                                    pickup: 0,
                                    apiToken:
                                        CacheHelper.getFromShared("token"));
                              } else if (i == 3) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 0,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 5);
                              } else if (i == 4) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 0,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 6);
                              } else if (i == 5) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 0,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 7);
                              }
                            } else {
                              if (i == 0) {
                                OrdersCubit.get(context).getAllOrders(
                                    delivery: 0,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"));
                              } else if (i == 3) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 0,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 5);
                              } else if (i == 4) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 0,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 6);
                              } else if (i == 5) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 0,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 7);
                              }
                            }
                            OrdersCubit.get(context).selectedIndex = i;
                            OrdersCubit.get(context).changeRadioButton();
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              _barMetaData[i],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                            // height: 50,
                            width: 110.0,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 227, 223, 223),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  OrdersCubit.get(context).selectedIndex == i
                                      ? BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                        )
                                      : BoxShadow()
                                ]),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                    ]),
              ),
              InkWell(
                onTap: () {
                  _showModalSheet(context);
                },
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 231, 229, 228)),
                  child: Image.asset("assets/filter.png"),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
