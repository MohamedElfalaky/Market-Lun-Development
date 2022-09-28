import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Delivery_Order.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Horizontal_filter_bar.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Navigation_Drawer%20_Widget.dart';
import 'package:market_app/Presentation/Widgets/Search%20widget/Search.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

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
                showSearch(context: context, delegate: mySearchDelegate());
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
                    HorizontalFilterBar(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: BlocConsumer<OrdersCubit, OrdersState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return ListView.builder(
                              itemCount: state is! OrdersSuccess
                                  ? 20
                                  : state.myOrdermodel.data.length,
                              itemBuilder: (context, index) {
                                return state is! OrdersSuccess
                                    ? CircularProgressIndicator()
                                    : DeliveryOrder(
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
