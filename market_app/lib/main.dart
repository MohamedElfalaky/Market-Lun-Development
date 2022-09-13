import 'package:flutter/material.dart';
import 'package:market_app/Screens/CheckMail.dart';
import 'package:market_app/Screens/CreateNewPass.dart';
import 'package:market_app/Screens/LogIn.dart';
import 'package:market_app/Screens/Notifications.dart';
import 'package:market_app/Screens/OrderDetails.dart';
import 'package:market_app/Screens/Orders.dart';
import 'package:market_app/Screens/ResetPass.dart';
import 'package:market_app/Screens/Settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // '/': (context) => const LogIn(),
          '/login': (context) => const LogIn(),
          '/resetpassword': (context) => ResetPass(),
          '/checkmail': (context) => const CheckMail(),
          '/createnewpass': (context) => const CreateNewPass(),
          '/orderspage': (context) => const OrdersPage(),
          '/ordersdetails': (context) => const OrderDetails(),
          '/notifications': (context) => const Notifications(),
          '/settings': (context) => const Settings(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              actionsIconTheme: IconThemeData(color: Colors.black, size: 37),
              iconTheme: IconThemeData(
                color: Colors.black,
                size: 37,
              ),
              titleTextStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          primarySwatch: Colors.red,

          // iconTheme: IconThemeData(color: Colors.red)
        ),
        home: LogIn());
  }
}
