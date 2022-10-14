import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/PopUs/FilterPopUp/PopUpContent.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/AppLocalizations.dart';

class FilterPopUp extends StatelessWidget {
  const FilterPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.83,
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 244, 240),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: MediaQuery.of(context).size.height * 0.06,
              child: Center(
                  child: Text(
                'Filter'.tr(context),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ))),
          Padding(
              padding: const EdgeInsets.all(8.0), child: FilterPopUpContent()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .06,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ElevatedButton(
                child: Text('Save'.tr(context)),
                onPressed: () {
                  // if()

                  if (OrdersCubit.selectedValue1.tr(context) ==
                      "All".tr(context)) {
                    OrdersCubit.get(context).getAllOrders(
                        delivery: 1,
                        pickup: 1,
                        apiToken: CacheHelper.getFromShared("token"));
                  } else if (OrdersCubit.selectedValue1.tr(context) ==
                      "Pick up".tr(context)) {
                    OrdersCubit.get(context).getAllOrders(
                        delivery: 0,
                        pickup: 1,
                        apiToken: CacheHelper.getFromShared("token"));
                  } else if (OrdersCubit.selectedValue1.tr(context) ==
                      "Delivery".tr(context)) {
                    OrdersCubit.get(context).getAllOrders(
                        delivery: 1,
                        pickup: 0,
                        apiToken: CacheHelper.getFromShared("token"));
                  }

                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          TextButton(
            child: Text('Reset all filters'.tr(context)),
            onPressed: () {
              OrdersCubit.get(context).getAllOrders(
                  delivery: 1,
                  pickup: 1,
                  apiToken: CacheHelper.getFromShared("token"));
              OrdersCubit.selectedValue1 = "All".tr(context);
              OrdersCubit.selectedValue2 = "Today".tr(context);

              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
