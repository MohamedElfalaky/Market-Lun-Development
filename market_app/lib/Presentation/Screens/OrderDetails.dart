import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/Billing_Info.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/Bottom_Navigation_Bar.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/Client_info.dart';
import 'package:market_app/Presentation/Widgets/Orders%20Details%20Widgets/Order_Info.dart';
import 'package:market_app/Presentation/Widgets/Search%20widget/Search.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import '../../data/Shared/AppLocalizations.dart';

class OrderDetails extends StatefulWidget {
  final int? id;
  final String? status;
  final driverName;
  final contextt;
  OrderDetails({this.id, this.status, this.driverName, this.contextt});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  void initState() {
    TestCubit.get(context).getOrdersDetails(
        apiToken: CacheHelper.getFromShared("token"),
        orderId: widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Details".tr(context)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.pop(context);
            }),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: ListView(children: [
          ClientInfo(),
          BlocBuilder<TestCubit, TestState>(
            builder: (context, state) {
              return state is TestSuccess
                  ? OrderInfo(
                      status: state.myOrderDetailsModel.data.status,
                      id: state.myOrderDetailsModel.data.orderId.toString(),
                      driverName: state.myOrderDetailsModel.data.driverName,
                      orderType: state.myOrderDetailsModel.data.orderType,
                      time: state.myOrderDetailsModel.data.time.toString(),
                      updateAt: state.myOrderDetailsModel.data.updatedAt,
                      hint: state.myOrderDetailsModel.data.hint,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          BillingInfo(),
        ]),
        bottomNavigationBar: BlocBuilder<TestCubit, TestState>(
          builder: (context, state) {
            return state is TestSuccess
                ? MyBottomNavigationBar(
                    state.myOrderDetailsModel.data.status,
                    state.myOrderDetailsModel.data.orderId,
                    state.myOrderDetailsModel.data.driverName,
                    widget.contextt,
                    state.myOrderDetailsModel.data.preparingTime,
                    state.myOrderDetailsModel.data.expiredAt,
                    state.myOrderDetailsModel.data.timezone)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
