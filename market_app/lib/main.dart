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
import 'package:market_app/business_logic/cubits/Logout%20Cubit/logout_cubit.dart';
import 'package:market_app/business_logic/cubits/Login_cubit/login_cubit.dart';
import 'package:market_app/business_logic/cubits/Mail_sent_cubit/mail_sent_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/UniLinks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //WidgetsFlutterBinding.ensureInitialized used to ensure that every functions main will run completely then run app

  DioHelper.init();
  // initiating dio (base Url) in DioHelper class

  await CacheHelper.init();
  //initiating prefs (the instance of Shared Prefrences)

  UniLinks.initUniLink();
  UniLinks.initUniLinks();
  Widget widget;
  String? token = CacheHelper.getFromShared('token');
  if (token != null) {
    widget = OrdersPage();
  } else {
    widget = LogIn();
  }
//checking if theres token or not to decide which page will be the main(if there is token Login will be the main)

  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const   (to preview the app in varity of deviced in the emulator)

    MyApp(widget),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp(this.startWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
        BlocProvider(create: (context) => MailSentCubit())
      ],
      child: MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
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
