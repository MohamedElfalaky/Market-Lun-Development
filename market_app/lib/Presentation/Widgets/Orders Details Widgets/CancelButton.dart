import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
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
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class CancelButton extends StatelessWidget {
  final myCtx;
  final id;
  final driverName;
  final preparingTime;
  final timeZone;
  final int _navigateTothisIndex = 3;
  CancelButton(
      this.id, this.driverName, this.myCtx, this.preparingTime, this.timeZone);
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
    var currentDateTimeSA = tz.TZDateTime.from(DateTime.now(),
        tz.getLocation(timeZone)); // صيغة وقت بمنطقة زمنية لوقت السعودية الحالي
    var currentDateTimeEG =
        tz.TZDateTime.from(DateTime.now(), tz.getLocation("Africa/Cairo"));

    String currenSaTimeString =
        "${currentDateTimeSA.hour}:${currentDateTimeSA.minute}:${currentDateTimeSA.second}"; // صيغة نص لوقت السعودية
    var saFormate = DateFormat("HH:mm:ss")
        .parse(currenSaTimeString); // صيغة وقت السعودية الحالي

    String currenSaTimeDateString =
        "${currentDateTimeSA.year}-${currentDateTimeSA.month}-${currentDateTimeSA.day} ${currentDateTimeSA.hour}:${currentDateTimeSA.minute}:${currentDateTimeSA.second}";
    // صيغة نص لوقت السعودية
    var saTimeDateFormate = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(currenSaTimeDateString); // صيغة وقت السعودية الحالي

    // print(currentDateTimeSA);
    // print(currentDateTimeEG);

    // print(
    //   currentDateTimeEG.difference(currentDateTimeSA),
    // );

    // print(currenSaTimeString);
    // print(saFormate.difference(DateFormat("HH:mm").parse("12:20:00"))); // الحل

    print(
      // saFormate.millisecondsSinceEpoch +
      DateFormat("HH:mm:ss").parse("19:36:21").difference(saFormate).inMinutes,
    );
    print(DateTime.now());
    print(saTimeDateFormate);
    print(saFormate);

    // print(currenSaTimeString);

    if (driverName == "Not Assigned") {
      assignButton = Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                "Driver not assigned yet? ".tr(context),
                style: TextStyle(fontSize: 13),
              ),
              InkWell(
                onTap: () {
                  _showAlertDialog(context,
                      ChooseDriverPopUpWithTime(id)); // حاطط التايم بصفر
                },
                child: AutoSizeText(
                  "Assign now".tr(context),
                  style: TextStyle(
                      fontSize: 14,
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
                      height: Simplify.hightClc(context, 25),
                      width: Simplify.widthClc(context, 25),
                      child: Image.asset("assets/cooking.gif")),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        children: [
                          AutoSizeText(
                            "Time counter preparing".tr(context),
                            style: TextStyle(fontSize: 14),
                          ),
                          CountdownTimer(
                            endTime: DateTime.now().millisecondsSinceEpoch +
                                DateFormat("HH:mm:ss")
                                        .parse(preparingTime)
                                        .difference(saFormate)
                                        .inSeconds *
                                    1000,
                            onEnd: () {},
                            widgetBuilder: (context, time) {
                              var newMins;
                              var newSec;
                              if (time == null || time == 0) {
                                return AutoSizeText(
                                  "00:00:00",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 12, 34, 198),
                                      fontWeight: FontWeight.bold),
                                );
                              }
                              // if (time.min)
                              if (time.hours != 0 && time.hours != null) {
                                newMins = time.hours! * 60 + time.min!;
                              } else {
                                newMins = time.min;
                              }
                              if (newMins != null) {
                                if (newMins < 10) {
                                  newMins = "0${newMins}";
                                }
                              }
                              // else if (time.sec != null) {
                              //   if (time.sec! < 10) {
                              //     newSec = "0${time.sec}";
                              //   } else {
                              //     newSec = time.sec!;
                              //   }
                              // }
                              return AutoSizeText(
                                  '${newMins ?? "00"}:${time.sec ?? "00"}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 12, 34, 198),
                                      fontWeight: FontWeight.bold));
                            },
                          ),
                          // AutoSizeText(
                          //   "Counter",
                          //   style: TextStyle(
                          //       color: Color.fromARGB(255, 61, 33, 243)),
                          // ),
                          AutoSizeText(
                            "Mins".tr(context),
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: Simplify.hightClc(context, 48),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
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
                                    height: Simplify.hightClc(context, 48),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          UpdateOrderCubit.get(context)
                                              .updatePreparingToDelivered(
                                                  orderId: id);
                                        },
                                        child: AutoSizeText(
                                          "Delivered".tr(context),
                                          style: TextStyle(fontSize: 12),
                                        ),
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
                                        height: Simplify.hightClc(context, 48),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: AutoSizeText(
                                              "Delivered".tr(context),
                                              style: TextStyle(fontSize: 12),
                                            ),
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
                          height: Simplify.hightClc(context, 48),
                          child: OutlinedButton(
                            onPressed: () {
                              _showAlertDialog(context, DeclinePopUp(id));
                            },
                            child: AutoSizeText(
                              "Cancel".tr(context),
                              style: TextStyle(fontSize: 12),
                            ),
                            style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 245, 243, 243),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp))),
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
                              AutoSizeText(
                                "Driver not assigned yet? ".tr(context),
                                style: TextStyle(fontSize: 12),
                              ),
                              InkWell(
                                onTap: () {
                                  _showAlertDialog(
                                      context,
                                      ChooseDriverPopUpWithTime(
                                          id)); // حاطط التايم بصفر
                                },
                                child: AutoSizeText(
                                  "Assign now".tr(context),
                                  style: TextStyle(
                                      fontSize: 14,
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
