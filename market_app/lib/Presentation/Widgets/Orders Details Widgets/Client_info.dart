import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../data/Shared/AppLocalizations.dart';

class ClientInfo extends StatelessWidget {
  ClientInfo({super.key});

  Container myClientInfo(String metaa, String dataa, context) {
    return Container(
      padding: EdgeInsets.only(left: Simplify.widthClc(context, 10)),
      margin: EdgeInsets.symmetric(vertical: Simplify.hightClc(context, 8)),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: AutoSizeText(
              metaa,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Expanded(
            flex: 2,
            child: AutoSizeText(
              dataa,
              style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // margin: EdgeInsets.symmetric(vertical: Simplify.hightClc(context, 10)),
      child: ExpansionTile(
          title: Row(
            children: [
              Icon(
                Icons.person,
                size: 40,
              ),
              AutoSizeText(
                "Client Info".tr(context),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<TestCubit, TestState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return state is TestSuccess
                        ? Column(
                            children: [
                              myClientInfo(
                                  "Client Name".tr(context),
                                  state.myOrderDetailsModel.data.clientName,
                                  context),
                              myClientInfo(
                                  "Phone".tr(context),
                                  state.myOrderDetailsModel.data.clientPhone,
                                  context),
                              myClientInfo(
                                  "Address".tr(context),
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
