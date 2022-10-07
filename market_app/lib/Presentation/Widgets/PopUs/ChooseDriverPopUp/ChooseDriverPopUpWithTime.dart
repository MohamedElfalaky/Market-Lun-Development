import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Screens/Orders.dart';
import 'package:market_app/Presentation/Widgets/PopUs/ChooseDriverPopUp/ChooseDriverContentPopUp.dart';
import 'package:market_app/business_logic/cubits/Drivers_cubits/drivers_cubit.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';
import 'package:market_app/data/Models/DriversModel.dart';
import 'package:market_app/data/Models/NotificationsModel.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';

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
                      child: Text('Later'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
                          state is UpdateOrderSuccess
                              ? Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrdersPage(
                                            statusToinitiate: _currentState,
                                          )),
                                  ModalRoute.withName(""))
                              //  Navigator.pushNamedAndRemoveUntil(
                              //     context, "/orderspage", (route) => false)
                              : null;
                        },
                        builder: (context, state) {
                          return state is! UpdateOrderLoading
                              ? ElevatedButton(
                                  child: Text('Save'),
                                  onPressed: () {
                                    UpdateOrderCubit.get(context)
                                        .updateNotAssignedDriver(
                                            orderId: widget.id,
                                            driverId: dropdownValue);

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrdersPage(
                                                  statusToinitiate:
                                                      _currentState,
                                                )),
                                        ModalRoute.withName(""));
                                    OrdersCubit.get(context).selectedIndex =
                                        _navigateTothisIndex;
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
