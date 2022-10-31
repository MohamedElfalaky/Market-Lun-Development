import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/PopUs/FilterPopUp/Filter_PopUp.dart';
import 'package:market_app/business_logic/cubits/New_order_counter/new_order_counter_cubit.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';
import 'package:market_app/data/Shared/AppLocalizations.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import 'package:sizer/sizer.dart';

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
          // height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: 1,
                    left: Simplify.hightClc(context, 16),
                    top: Simplify.hightClc(context, 20),
                    bottom: Simplify.hightClc(context, 15)),
                height: Simplify.hightClc(context, 50),
                width: Simplify.widthClc(context, 300),
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
                            // height: Simplify.hightClc(context, 40),
                            width: Simplify.widthClc(context, 93),
                            decoration: BoxDecoration(
                                color: i == 1
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.secondary,
                                //to give "New" button its own style.
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.sp)),
                                boxShadow: [
                                  OrdersCubit.get(context).selectedIndex == i
                                      //to give special effect to the selected button.

                                      ? BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3.sp,
                                          blurRadius: 6.sp,
                                        )
                                      : BoxShadow()
                                ]),
                            margin: EdgeInsets.symmetric(
                                horizontal: Simplify.widthClc(context, 8),
                                vertical: Simplify.hightClc(context, 5)),
                            child: i == 1
                                ? Stack(children: [
                                    Center(
                                        child: AutoSizeText(
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )),
                                    Align(
                                      alignment: const Alignment(0.79, 0),
                                      child: Container(
                                        height: Simplify.hightClc(context, 20),
                                        width: Simplify.widthClc(context, 20),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                227, 251, 244, 242),
                                            borderRadius:
                                                BorderRadius.circular(10.sp)),
                                        child: Center(
                                          child: AutoSizeText(
                                            NewOrderCounterCubit.myCounter
                                                .toString(),
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    )
                                  ])
                                : Center(
                                    child: AutoSizeText(
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
                                        fontSize: 14,
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
                  margin:
                      EdgeInsets.only(right: Simplify.widthClc(context, 15)),
                  height: Simplify.hightClc(context, 37),
                  width: Simplify.widthClc(context, 37),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1.sp,
                          blurRadius: 2.sp,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.white),
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
