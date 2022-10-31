import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../data/Shared/AppLocalizations.dart';

class BillingInfo extends StatelessWidget {
  BillingInfo({super.key});

  Container myBillInfo(String metaa, String dataa, context) {
    return Container(
      padding: EdgeInsets.only(left: Simplify.widthClc(context, 10)),
      margin: EdgeInsets.symmetric(vertical: Simplify.hightClc(context, 8)),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            metaa,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          AutoSizeText(
            dataa,
            style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
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
                Icons.attach_money_rounded,
                size: 40,
              ),
              AutoSizeText(
                "Billing Info".tr(context),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<TestCubit, TestState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return state is TestSuccess
                        ? Column(
                            children: [
                              myBillInfo(
                                  "Payment Method".tr(context),
                                  state.myOrderDetailsModel.data.payment.method,
                                  context),
                              myBillInfo(
                                  "Subtotal".tr(context),
                                  "${state.myOrderDetailsModel.data.payment.subtotal} \$",
                                  context),
                              myBillInfo(
                                  "Delivery fees".tr(context),
                                  "${state.myOrderDetailsModel.data.payment.deliveryFee} \$",
                                  context),
                              myBillInfo(
                                  "Total".tr(context),
                                  "${state.myOrderDetailsModel.data.payment.deliveryFee + state.myOrderDetailsModel.data.payment.subtotal} \$",
                                  context),
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                )
              ],
            )
          ]),
    );
    ;
  }
}
