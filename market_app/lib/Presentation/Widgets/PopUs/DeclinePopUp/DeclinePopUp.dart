import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Screens/Orders.dart';
import 'package:market_app/Presentation/Widgets/PopUs/DeclinePopUp/DeclineContentPopUp.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';

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
  int currentState = 6;
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
                    state is UpdateOrderSuccess
                        ? Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrdersPage(
                                      statusToinitiate: navigateTothisIndex,
                                    )),
                            ModalRoute.withName(""))
                        : null;

                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, "orderspage", (route) => false,
                    //     arguments: currentState)
                    // : null;
                  },
                  builder: (context, state) {
                    return state is! UpdateOrderLoading
                        ? Container(
                            margin: EdgeInsets.only(bottom: 15),
                            width: MediaQuery.of(context).size.width * 0.7,
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
                                    OrdersCubit.get(context).selectedIndex =
                                        navigateTothisIndex;
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
