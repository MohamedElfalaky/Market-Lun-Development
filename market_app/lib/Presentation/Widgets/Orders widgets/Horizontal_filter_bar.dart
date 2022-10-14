import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/PopUs/FilterPopUp/Filter_PopUp.dart';
import 'package:market_app/business_logic/cubits/New_order_counter/new_order_counter_cubit.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';
import 'package:market_app/data/Shared/AppLocalizations.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';

class HorizontalFilterBar extends StatefulWidget {
  HorizontalFilterBar({super.key});
  static final List<String> _barMetaData = [
    "All",
    "New",
    "Preparing ",
    "Delivered", //5
    "Canceled", //6
    "Refunded", //7
  ];

  @override
  State<HorizontalFilterBar> createState() => _HorizontalFilterBarState();
}

class _HorizontalFilterBarState extends State<HorizontalFilterBar> {
  void _showModalSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: ((context) => const FilterPopUp()));
  }

  @override
  void initState() {
    NewOrderCounterCubit.get(context)
        .getOrders(apiToken: CacheHelper.getFromShared("token"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewOrderCounterCubit, NewOrderCounterState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    right: 12, left: 20, top: 15, bottom: 10),
                // height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.75,
                child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i = 0;
                          i < HorizontalFilterBar._barMetaData.length;
                          i++)
                        InkWell(
                          onTap: () {
                            if (OrdersCubit.selectedValue1.tr(context) ==
                                "All".tr(context)) {
                              if (i == 0) {
                                OrdersCubit.get(context).getAllOrders(
                                    delivery: 1,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"));
                              } else if (i == 1) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 1);
                              } else if (i == 2) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 2);
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
                              NewOrderCounterCubit.get(context).getOrders(
                                  apiToken: CacheHelper.getFromShared("token"));
                            } else if (OrdersCubit.selectedValue1.tr(context) ==
                                "Delivery".tr(context)) {
                              if (i == 0) {
                                OrdersCubit.get(context).getAllOrders(
                                    delivery: 1,
                                    pickup: 0,
                                    apiToken:
                                        CacheHelper.getFromShared("token"));
                              } else if (i == 1) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 0,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 1);
                              } else if (i == 2) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 1,
                                    pickup: 0,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 2);
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
                              NewOrderCounterCubit.get(context).getOrders(
                                  apiToken: CacheHelper.getFromShared("token"));
                            } else if ((OrdersCubit.selectedValue1
                                    .tr(context) ==
                                "Pick up".tr(context))) {
                              if (i == 0) {
                                OrdersCubit.get(context).getAllOrders(
                                    delivery: 0,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"));
                              } else if (i == 1) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 0,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 1);
                              } else if (i == 2) {
                                OrdersCubit.get(context).getOrders(
                                    delivery: 0,
                                    pickup: 1,
                                    apiToken:
                                        CacheHelper.getFromShared("token"),
                                    status: 2);
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
                              NewOrderCounterCubit.get(context).getOrders(
                                  apiToken: CacheHelper.getFromShared("token"));
                            }
                            OrdersCubit.get(context).selectedIndex = i;
                          },
                          child: Container(
                            width: 110.0,
                            decoration: BoxDecoration(
                                color: i == 1
                                    ? const Color.fromARGB(255, 250, 107, 97)
                                    : const Color.fromARGB(255, 242, 238, 238),
                                //to give "New" button its own style.
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  OrdersCubit.get(context).selectedIndex == i
                                      //to give special effect to the selected button.

                                      ? BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                        )
                                      : const BoxShadow()
                                ]),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: i == 1
                                ? Stack(children: [
                                    Center(
                                        child: Text(
                                      [
                                        "All",
                                        "New",
                                        "Preparing",
                                        "Delivered", //5
                                        "Canceled", //6
                                        "Refunded", //7
                                      ][i]
                                          .tr(context),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )),
                                    Align(
                                      alignment: const Alignment(0.79, 0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 195, 185, 184),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(NewOrderCounterCubit
                                                .myCounter
                                                .toString())),
                                      ),
                                    )
                                  ])
                                : Center(
                                    child: Text(
                                    [
                                      "All",
                                      "New",
                                      "Preparing",
                                      "Delivered", //5
                                      "Canceled", //6
                                      "Refunded", //7
                                    ][i]
                                        .tr(context),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
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
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 231, 229, 228)),
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
