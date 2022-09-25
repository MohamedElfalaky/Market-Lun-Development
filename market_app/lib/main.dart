import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Screens/CheckMail.dart';
import 'package:market_app/Presentation/Screens/CreateNewPass.dart';
import 'package:market_app/Presentation/Screens/LogIn.dart';
import 'package:market_app/Presentation/Screens/Notifications.dart';
import 'package:market_app/Presentation/Screens/OrderDetails.dart';
import 'package:market_app/Presentation/Screens/Orders.dart';
import 'package:market_app/Presentation/Screens/ResetPass.dart';
import 'package:market_app/Presentation/Screens/ReturnToLogin.dart';
import 'package:market_app/Presentation/Screens/Settings.dart';
import 'package:device_preview/device_preview.dart';
import 'package:market_app/business_logic/cubits/cubit/login_cubit.dart';
import 'package:market_app/data/Local/CacheHelper.dart';
import 'package:market_app/data/Remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  String? token = CacheHelper.getToken('token');
  if (token != null) {
    widget = OrdersPage();
  } else {
    widget = LogIn();
  }
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const

    MyApp(widget), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp(this.startWidget);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            // '/': (context) => const LogIn(),
            '/login': (context) => LogIn(),
            '/resetpassword': (context) => ResetPass(),
            '/checkmail': (context) => const CheckMail(),
            '/createnewpass': (context) => const CreateNewPass(),
            '/returntologin': (context) => const ReturnToLogin(),
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
          home: startWidget),
    );
  }
}
