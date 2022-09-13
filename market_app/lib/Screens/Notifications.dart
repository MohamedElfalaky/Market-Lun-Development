import 'package:flutter/material.dart';
import 'package:market_app/Widgets/Notifications%20Widgets/One_Notification.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
      body: ListView(
        children: [
          OneNotification(),
          OneNotification(),
          OneNotification(),
          OneNotification(),
          OneNotification()
        ],
      ),
    );
  }
}
