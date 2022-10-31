import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
              "market_app", "market_app_channel",
              importance: Importance.max,
              priority: Priority.high,
              channelDescription: "this is our discription!!!",
              playSound: true,
              sound: RawResourceAndroidNotificationSound("notificationsound")));
      await _notificationsPlugin.show(id, message.notification?.title,
          message.notification?.body, notificationDetails);
    } on Exception catch (e) {
      print(e);
    }
  }
}
