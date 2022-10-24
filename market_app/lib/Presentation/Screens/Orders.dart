import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Screens/OrderDetails.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Delivery_Order.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Horizontal_filter_bar.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Navigation_Drawer%20_Widget.dart';
import 'package:market_app/Presentation/Widgets/Search%20widget/Search.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/data/Services/local_notification_service.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import '../../data/Shared/AppLocalizations.dart';

class OrdersPage extends StatefulWidget {
  final int statusToinitiate;
  const OrdersPage({required this.statusToinitiate});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    //gives u the message on which user taps  and it opens the app from the terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      final routeFromMessage =
          message?.data["route"]; // الكي والفاليو من الفايربيز نفسه

      // Navigator.of(context).pushNamed(routeFromMessage);
      // LocalNotificationService.display(message!); // show notification head
    });

    //on forground not background
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification?.body);
      print(message.notification?.title);
      LocalNotificationService.display(message); // show notification head
    });

    //When app is in background but opened, and user taps on the notifcation
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage =
          message.data["route"]; // الكي والفاليو من الفايربيز نفسه

      Navigator.of(context).pushNamed(routeFromMessage);
      // LocalNotificationService.display(message); // show notification head
    });

    if (widget.statusToinitiate == 2) {
      OrdersCubit.get(context).getOrders(
          delivery: 1,
          pickup: 1,
          apiToken: CacheHelper.getFromShared("token"),
          status: 2);
    } else if (widget.statusToinitiate == 4) {
      OrdersCubit.get(context).getOrders(
          delivery: 1,
          pickup: 1,
          apiToken: CacheHelper.getFromShared("token"),
          status: 6);
    } else if (widget.statusToinitiate == 3) {
      OrdersCubit.get(context).getOrders(
          delivery: 1,
          pickup: 1,
          apiToken: CacheHelper.getFromShared("token"),
          status: 5);
    } else {
      OrdersCubit.get(context).getAllOrders(
          delivery: 1, pickup: 1, apiToken: CacheHelper.getFromShared("token"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Orders".tr(context)),
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
                height: MediaQuery.of(context).size.height * 0.9,
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
                                                  builder: (contexttt) =>
                                                      OrderDetails(
                                                        id: state
                                                            .myOrdermodel
                                                            .data[index]
                                                            .orderId,
                                                        status: state
                                                            .myOrdermodel
                                                            .data[index]
                                                            .orderStatus,
                                                        driverName: state
                                                            .myOrdermodel
                                                            .data[index]
                                                            .driverName,
                                                        contextt: contexttt,
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
                                          time: state.myOrdermodel.data[index]
                                              .preparingTime,
                                          expiration: state.myOrdermodel
                                              .data[index].expiredAt,
                                          timeZone: state.myOrdermodel
                                              .data[index].timezone,
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
