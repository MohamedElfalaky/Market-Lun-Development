import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/Presentation/Screens/Orders.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclineContentPopUp.dart';
import 'package:market_app/business_logic/cubits/New_order_counter/new_order_counter_cubit.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';

class DeclinePopUp extends StatefulWidget {
  final id;
  const DeclinePopUp(this.id);

  @override
  State<DeclinePopUp> createState() => _DeclinePopUpState();
}

class _DeclinePopUpState extends State<DeclinePopUp> {
  bool _throwShotAway = false;
  final myControlled = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int navigateTothisIndex = 4;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: const EdgeInsets.all(8.0), child: DeclineContentPopUp()),

      actions: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(124, 222, 218, 216),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.0, left: 18, right: 8),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the reason";
                            }
                          },
                          controller: myControlled,
                          maxLines: 8, //or null
                          decoration: InputDecoration.collapsed(
                              hintText: "Enter your text here"),
                        ),
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Checkbox(
                      value: _throwShotAway,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _throwShotAway = newValue!;
                        });
                      },
                    ),
                    Text("Request for refund?")
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Center(
                child: BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
                  listener: (context, state) {
                    state is declineOrderSuccess
                        ? () {
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
                                navigateTothisIndex;

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
                                orderId: widget.id.toString());

                            NewOrderCounterCubit.get(context).getOrders(
                                apiToken: CacheHelper.getFromShared(
                                    "token")); // to update "New" Counter and tab bar (change the selected index)
                          }()
                        : null;
                  },
                  builder: (context, state) {
                    return state is! UpdateOrderLoading
                        ? Container(
                            margin: EdgeInsets.only(bottom: 15),
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: MediaQuery.of(context).size.height * 0.055,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ElevatedButton(
                                child: Text(
                                  'Save',
                                  style: TextStyle(fontSize: 18),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    UpdateOrderCubit.get(context).declineOrder(
                                        orderId: widget.id,
                                        cancelReason: myControlled.text);
                                  }
                                },
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ],
          ),
        )
        // SizedBox(
        //   height: 70,
        // )
      ],
    );
    ;
  }
}
