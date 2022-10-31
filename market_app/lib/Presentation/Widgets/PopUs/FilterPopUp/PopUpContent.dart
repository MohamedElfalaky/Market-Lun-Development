import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class FilterPopUpContent extends StatelessWidget {
  FilterPopUpContent({super.key});

  Widget myFilterPopUp(List myList, int index, context) {
    return Container(
      margin: EdgeInsets.all(5.sp),
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: myList.map((listItem) {
          return RadioListTile<String>(
            value: listItem,
            groupValue: index == 0
                ? OrdersCubit.selectedValue1
                : OrdersCubit.selectedValue2,
            title: AutoSizeText(listItem.toString().tr(context),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            onChanged: ((value) {
              // listItem = value!;
              if (index == 0) {
                OrdersCubit.selectedValue1 = value!;
                OrdersCubit.get(context).changeRadioButton();
                print(OrdersCubit.selectedValue1);
                print(value);
              } else {
                OrdersCubit.selectedValue2 = value!;
                OrdersCubit.get(context).changeRadioButton();
              }
            }),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Column(children: [
                Row(
                  children: [
                    SizedBox(
                        height: Simplify.hightClc(context, 30),
                        child: Icon(Icons.shopping_bag)),
                    AutoSizeText(
                      "Order status".tr(context),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                myFilterPopUp(OrdersCubit.values1, 0, context),
                // myFilterPopUp(values2, selectedValue2, context)
              ]),
              Column(children: [
                Row(
                  children: [
                    SizedBox(
                        height: Simplify.hightClc(context, 30),
                        child: Icon(Icons.date_range)),
                    AutoSizeText(
                      "Date".tr(context),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                myFilterPopUp(OrdersCubit.values2, 1, context),
                // myFilterPopUp(values2, selectedValue2, context)
              ])
            ],
          ),
        );
      },
    );
    ;
  }
}
