import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Screens/OrderDetails.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Delivery_Order.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Horizontal_filter_bar.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Navigation_Drawer%20_Widget.dart';
import 'package:market_app/Presentation/Widgets/Search%20widget/Search.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    OrdersCubit.get(context).getAllOrders(
        delivery: 1, pickup: 1, apiToken: CacheHelper.getFromShared("token"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Orders"),
        // iconTheme: IconThemeData(color: Colors.red),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: Icon(Icons.search))
        ],
        // bottom: HorizontalFilterBar(),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: Column(
                  children: [
                    SizedBox(child: HorizontalFilterBar()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: BlocConsumer<OrdersCubit, OrdersState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return ListView.builder(
                              itemCount: state is! OrdersSuccess
                                  ? 1
                                  : state.myOrdermodel.data.length,
                              itemBuilder: (context, index) {
                                return state is! OrdersSuccess
                                    ? Center(
                                        child: Container(
                                            margin: EdgeInsets.only(top: 300),
                                            child: CircularProgressIndicator()),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderDetails(
                                                        id: state
                                                            .myOrdermodel
                                                            .data[index]
                                                            .orderId,
                                                        status: state
                                                            .myOrdermodel
                                                            .data[index]
                                                            .orderStatus,
                                                      )));
                                        },
                                        child: DeliveryOrder(
                                          id: state
                                              .myOrdermodel.data[index].orderId,
                                          name: state.myOrdermodel.data[index]
                                              .clientName,
                                          paymentMethod: state.myOrdermodel
                                              .data[index].paymentMethod,
                                          driverName: state.myOrdermodel
                                              .data[index].driverName,
                                          total: state
                                              .myOrdermodel.data[index].total,
                                          status: state.myOrdermodel.data[index]
                                              .orderStatus,
                                          receiveMethod: state.myOrdermodel
                                              .data[index].receiveMethod,
                                        ),
                                      );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
