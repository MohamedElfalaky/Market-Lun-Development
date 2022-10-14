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
import '../../../../data/Shared/AppLocalizations.dart';

class ChooseDriverPopUp extends StatefulWidget {
  final id;
  final int myTime;
  ChooseDriverPopUp(this.myTime, this.id);

  @override
  State<ChooseDriverPopUp> createState() => _ChooseDriverPopUpState();
}

class _ChooseDriverPopUpState extends State<ChooseDriverPopUp> {
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
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            scrollable: true,
            // title: Text('Filter'),
            content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChooseDriverPopUpContent()),

            actions: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(left: 20, right: 15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(126, 217, 205, 204),
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width * .8,
                child: DropdownButton<String>(
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20),
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
                    print(widget.myTime);
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
                  BlocBuilder<UpdateOrderCubit, UpdateOrderState>(
                    builder: (context, state) {
                      return state is! NewToPreparinLoading
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.23,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: OutlinedButton(
                                child: Text('Later'.tr(context)),
                                onPressed: () {
                                  UpdateOrderCubit.get(context)
                                      .updateNewToPreparing(
                                          time: widget.myTime,
                                          orderId: widget.id);
                                },
                              ),
                            )
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
                        listener: (context, state) {
                          if (state is NewToPreparingWithDriverSuccess) {
                            () async {
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
                              Navigator.pop(context); //  التانيه شيل البوب آب
                              OrdersCubit.get(context)
                                      .selectedIndex = //حط شادو علي التاب اللي اتعدل لها الستيت
                                  _navigateTothisIndex;

                              await OrdersCubit.get(context).getOrders(
                                  // رندر الاوردر ليست
                                  delivery: 1,
                                  pickup: 1,
                                  status: 2,
                                  apiToken: CacheHelper.getFromShared("token"));

                              await NewOrderCounterCubit.get(context).getOrders(
                                  apiToken: CacheHelper.getFromShared(
                                      "token")); // to update "New" Counter and tab bar (change the selected index)

                              await TestCubit.get(context).getOrdersDetails(
                                  apiToken: CacheHelper.getFromShared("token"),
                                  orderId: widget.id.toString());

                              await TestCubit.get(context).pleaseRender();

                              AssignCubit.get(context).getOrdersDetails(
                                  apiToken: CacheHelper.getFromShared("token"),
                                  orderId: widget.id.toString());
                            }();
                          } else if (state is NewToPreparingSuccess) {
                            () async {
                              Navigator.pop(context); //شيل البوب آب
                              Navigator.pop(context); //شيل البوب آب التانيه
                              OrdersCubit.get(context)
                                      .selectedIndex = //حط شادو علي التاب اللي اتعدل لها الستيت
                                  _navigateTothisIndex;

                              await OrdersCubit.get(context).getOrders(
                                  // رندر الاوردر ليست
                                  delivery: 1,
                                  pickup: 1,
                                  status: 2,
                                  apiToken: CacheHelper.getFromShared("token"));

                              await NewOrderCounterCubit.get(context).getOrders(
                                  apiToken: CacheHelper.getFromShared(
                                      "token")); // to update "New" Counter and tab bar (change the selected index)

                              TestCubit.get(context).getOrdersDetails(
                                  apiToken: CacheHelper.getFromShared("token"),
                                  orderId: widget.id.toString());
                              //     .test(); // رندر التاب بار
                            }();
                          }
                        },
                        builder: (context, state) {
                          return state is! UpdateOrderLoading
                              ? ElevatedButton(
                                  child: Text('Save'.tr(context)),
                                  onPressed: () {
                                    UpdateOrderCubit.get(context)
                                        .updateNewToPreparingWithDriver(
                                            time: widget.myTime,
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
                height: 20,
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
