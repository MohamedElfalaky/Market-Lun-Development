import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/Notifications%20Widgets/One_Notification.dart';
import 'package:market_app/business_logic/cubits/Notification_cubit/notifications_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    NotificationsCubit.get(context)
        .getNotifications(apiToken: CacheHelper.getFromShared("token"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
              itemExtent: 100,
              itemCount: state is! NotificationsSuccess
                  ? 1
                  : state.myNotificationsModel.data.length,
              itemBuilder: (context, index) {
                return state is! NotificationsSuccess
                    ? Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 300),
                            child: CircularProgressIndicator()),
                      )
                    : OneNotification(
                        body: state.myNotificationsModel.data[index].body,
                        date: state.myNotificationsModel.data[index].date,
                      );
              });
        },
      ),
    );
  }
}
