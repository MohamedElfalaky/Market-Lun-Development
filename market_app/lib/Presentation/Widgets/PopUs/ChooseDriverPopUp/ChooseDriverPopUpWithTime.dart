import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/Presentation/Screens/Orders.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverContentPopUp.dart';
import 'package:market_app/business_logic/cubits/AssignCubit/Assign_cubit.dart';
import 'package:market_app/business_logic/cubits/Drivers_cubits/drivers_cubit.dart';
import 'package:market_app/business_logic/cubits/New_order_counter/new_order_counter_cubit.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';
import 'package:market_app/data/Models/DriversModel.dart';
import 'package:market_app/data/Models/NotificationsModel.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../../data/Shared/AppLocalizations.dart';
import "package:sizer/sizer.dart";

class ChooseDriverPopUpWithTime extends StatefulWidget {
  final id;
  ChooseDriverPopUpWithTime(this.id);

  @override
  State<ChooseDriverPopUpWithTime> createState() =>
      _ChooseDriverPopUpWithTimeState();
}

class _ChooseDriverPopUpWithTimeState extends State<ChooseDriverPopUpWithTime> {
  int _navigateTothisIndex = 2;
  int _currentState = 2;
  @override
  void initState() {
    DriversCubit.get(context)
        .getDrivers(apiToken: CacheHelper.getFromShared("token"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriversCubit, DriversState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DriversSuccess) {
          String dropdownValue = state.myDriversModel.data[0].id
              .toString(); // تخزين قيمه الاختيار الاول
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0.sp))),
            scrollable: true,
            // title: Text('Filter'),
            content: Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: ChooseDriverPopUpContent()),

            actions: <Widget>[
              Container(
                margin: EdgeInsets.all(15.sp),
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                decoration: BoxDecoration(
                    color: Color.fromARGB(126, 217, 205, 204),
                    borderRadius: BorderRadius.circular(10.sp)),
                width: MediaQuery.of(context).size.width * .8,
                child: DropdownButton<String>(
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20.sp),
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  elevation: 16,
                  // style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.

                    dropdownValue =
                        value!; // قيمه الاختيار تتغير عند اختيار قيمه جديدة
                    print(dropdownValue);
                  },
                  items: state.myDriversModel.data
                      .map<DropdownMenuItem<String>>((Dataa value) {
                    return DropdownMenuItem<String>(
                      value: value.id.toString(),
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: OutlinedButton(
                      child: Text('Later'.tr(context)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: Simplify.widthClc(context, 10),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.sp),
                      child: BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
                        listener: (context, state) {
                          state is NotAssignedDriverSuccess
                              ? () async {
                                  // Fluttertoast.showToast(
                                  //     msg: state.myUpdateOrderModel.message,
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.BOTTOM,
                                  //     timeInSecForIosWeb: 2,
                                  //     backgroundColor:
                                  //         Color.fromARGB(255, 223, 47, 34),
                                  //     textColor: Colors.white,
                                  //     fontSize: 16.0); // اظهر توست
                                  Navigator.pop(context); //شيل البوب آب
                                  OrdersCubit.get(context)
                                          .selectedIndex = //حط شادو علي التاب اللي اتعدل لها الستيت
                                      _navigateTothisIndex;

                                  await OrdersCubit.get(context).getOrders(
                                      // رندر الاوردر ليست
                                      delivery: 1,
                                      pickup: 1,
                                      status: 2,
                                      apiToken:
                                          CacheHelper.getFromShared("token"));
                                  // NewOrderCounterCubit.get(context)
                                  //     .test(); // رندر التاب

                                  NewOrderCounterCubit.get(context).getOrders(
                                      apiToken: CacheHelper.getFromShared(
                                          "token")); // to update "New" Counter and tab bar (change the selected index)

                                  //عشان الديتيلز
                                  await TestCubit.get(context).getOrdersDetails(
                                      apiToken:
                                          CacheHelper.getFromShared("token"),
                                      orderId: widget.id.toString());

                                  // عشان الاسسين بوتون

                                  AssignCubit.get(context).getOrdersDetails(
                                      apiToken:
                                          CacheHelper.getFromShared("token"),
                                      orderId: widget.id.toString());
                                }()
                              : null;
                        },
                        builder: (context, state) {
                          return state is! UpdateOrderLoading
                              ? ElevatedButton(
                                  child: Text('Save'.tr(context)),
                                  onPressed: () {
                                    UpdateOrderCubit.get(context)
                                        .updateNotAssignedDriver(
                                            orderId: widget.id,
                                            driverId: dropdownValue);
                                  },
                                )
                              : Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Simplify.hightClc(context, 20),
              )
            ],
          );
        } else {
          return Center(
            child: Container(
                height: 100, width: 100, child: CircularProgressIndicator()),
          );
        }
      },
    );
    ;
  }
}
