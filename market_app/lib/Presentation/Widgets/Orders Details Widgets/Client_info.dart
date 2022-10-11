import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';

class ClientInfo extends StatelessWidget {
  ClientInfo({super.key});

  Container myClientInfo(String metaa, String dataa, context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      margin: EdgeInsets.only(bottom: 10, top: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              metaa,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              dataa,
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: ExpansionTile(
          title: Row(
            children: [
              Icon(
                Icons.person,
                size: 40,
              ),
              Text(
                " Client Info.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<TestCubit, TestState>(
                  listener: (context, state) {
                    if (state is TestSuccess) {
                      print(
                          "slkmlkdnjknlwjndwlsnwljnsjlwnsljwnjlwnkljswnljsnkjbehkbflqndewn");
                    }
                  },
                  builder: (context, state) {
                    return state is TestSuccess
                        ? Column(
                            children: [
                              myClientInfo(
                                  "Client Name",
                                  state.myOrderDetailsModel.data.clientName,
                                  context),
                              myClientInfo(
                                  "Phone",
                                  state.myOrderDetailsModel.data.clientPhone,
                                  context),
                              myClientInfo(
                                  "Address",
                                  state.myOrderDetailsModel.data.address,
                                  context),
                            ],
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                )
              ],
            )
          ]),
    );
    ;
  }
}
