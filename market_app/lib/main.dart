import 'package:flutter/material.dart';
import 'package:market_app/CheckMail.dart';
import 'package:market_app/CreateNewPass.dart';
import 'package:market_app/LogIn.dart';
import 'package:market_app/ResetPass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          // '/': (context) => const LogIn(),
          '/login': (context) => const LogIn(),
          '/resetpassword': (context) => ResetPass(),
          '/checkmail': (context) => const CheckMail(),
          '/createnewpass': (context) => const CreateNewPass(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.white),
            primarySwatch: Colors.blue),
        home: LogIn());
  }
}
