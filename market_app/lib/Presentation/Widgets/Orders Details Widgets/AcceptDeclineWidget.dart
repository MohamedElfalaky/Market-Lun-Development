import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:intl/intl.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseTimePopUp/ChooseTimePopUp.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclinePopUp.dart';
import 'package:market_app/business_logic/cubits/New_order_counter/new_order_counter_cubit.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import '../../../data/Shared/AppLocalizations.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class AcceptDecline extends StatelessWidget {
  final id;
  final expirationTime;
  final timeZone;
  AcceptDecline(this.id, this.expirationTime, this.timeZone);

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
    var currentDateTimeSA = tz.TZDateTime.from(DateTime.now(),
        tz.getLocation(timeZone)); // صيغة وقت بمنطقة زمنية لوقت السعودية الحالي
    var currentDateTimeEG =
        tz.TZDateTime.from(DateTime.now(), tz.getLocation("Africa/Cairo"));

    String currenSaTimeString =
        "${currentDateTimeSA.hour}:${currentDateTimeSA.minute}:${currentDateTimeSA.second}"; // صيغة نص لوقت السعودية
    var saFormate = DateFormat("HH:mm:ss")
        .parse(currenSaTimeString); // صيغة وقت السعودية الحالي

    print(saFormate);

    // void onEnd() {
    //   UpdateOrderCubit.get(context)
    //       .declineOrder(orderId: id, cancelReason: "s");
    // }

    return BlocListener<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        state is declineOrderSuccess
            ? () {
                OrdersCubit.get(context)
                        .selectedIndex = //حط شادو علي التاب اللي اتعدل لها الستيت
                    4;

                OrdersCubit.get(context).getOrders(
                    // رندر الاوردر ليست
                    delivery: 1,
                    pickup: 1,
                    status: 6,
                    apiToken: CacheHelper.getFromShared("token"));
                // NewOrderCounterCubit.get(context)
                //     .test(); // رندر التاب بار

                TestCubit.get(context).getOrdersDetails(
                    apiToken: CacheHelper.getFromShared("token"),
                    orderId: id.toString());

                NewOrderCounterCubit.get(context).getOrders(
                    apiToken: CacheHelper.getFromShared(
                        "token")); // to update "New" Counter and tab bar (change the selected index)
              }()
            : null;
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/200w.gif")),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Text("Time counter new".tr(context))),

                        CountdownTimer(
                          endTime: DateTime.now().millisecondsSinceEpoch +
                              DateFormat("HH:mm:ss")
                                      .parse(expirationTime)
                                      .difference(saFormate)
                                      .inSeconds *
                                  1000,
                          onEnd: () {
                            UpdateOrderCubit.get(context)
                                .declineOrderImmediately(
                                    orderId: id, cancelReason: "d");
                            // context
                            //     .read<UpdateOrderCubit>()
                            //     .declineOrder(orderId: id, cancelReason: "s");
                          },
                          widgetBuilder: (context, time) {
                            var newMins;
                            var newSec;

                            if (time == null || time == 0) {
                              return Text(
                                "00:00:00",
                                style: TextStyle(
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
                            return Text(
                                '${newMins ?? "00"}:${time.sec ?? "00"}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 12, 34, 198),
                                    fontWeight: FontWeight.bold));
                          },
                        ),
                        // Text(
                        //   "Counter",
                        //   style: TextStyle(
                        //       color: Color.fromARGB(255, 61, 33, 243)),
                        // ),
                        Text(
                          "Mins".tr(context),
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: ElevatedButton(
                                onPressed: () {
                                  _showAlertDialog(context, ChoosTimePopUp(id));
                                },
                                child: Text("Accept".tr(context)),
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 60, 238, 60)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              _showAlertDialog(context, DeclinePopUp(id));
                            },
                            child: Text("Decline".tr(context)),
                            style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 245, 240, 240),
                                side: BorderSide(color: Colors.red, width: 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
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
    );
  }
}
