import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:market_app/Presentation/Screens/CheckMail.dart';
import 'package:market_app/Presentation/Screens/CreateNewPass.dart';
import 'package:market_app/Presentation/Screens/LogIn.dart';
import 'package:market_app/Presentation/Screens/Notifications.dart';
import 'package:market_app/Presentation/Screens/OrderDetails.dart';
import 'package:market_app/Presentation/Screens/Orders.dart';
import 'package:market_app/Presentation/Screens/ResetPass.dart';
import 'package:market_app/Presentation/Screens/ReturnToLogin.dart';
import 'package:market_app/Presentation/Screens/Search.dart';
import 'package:market_app/Presentation/Screens/Settings.dart';
import 'package:device_preview/device_preview.dart';
import 'package:market_app/business_logic/cubits/AssignCubit/Assign_cubit.dart';
import 'package:market_app/business_logic/cubits/Drivers_cubits/drivers_cubit.dart';
import 'package:market_app/business_logic/cubits/Local/local_cubit.dart';
import 'package:market_app/business_logic/cubits/Logout%20Cubit/logout_cubit.dart';
import 'package:market_app/business_logic/cubits/Login_cubit/login_cubit.dart';
import 'package:market_app/business_logic/cubits/Mail_sent_cubit/mail_sent_cubit.dart';
import 'package:market_app/business_logic/cubits/New_order_counter/new_order_counter_cubit.dart';
import 'package:market_app/business_logic/cubits/Notification_cubit/notifications_cubit.dart';
import 'package:market_app/business_logic/cubits/Order_details_Cubit/order_details_cubit.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/Search_cubit/search_cubit.dart';
import 'package:market_app/business_logic/cubits/TestCubit/Test_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_Password_cubit/cubit/update_password_cubit.dart';
import 'package:market_app/business_logic/cubits/Update_order_cubit/update_order_cubit.dart';
import 'package:market_app/business_logic/cubits/settings_cubit/settings_cubit.dart';
import 'package:market_app/business_logic/debug/app_bloc_observer.dart';
import 'package:market_app/data/Services/local_notification_service.dart';
import 'package:market_app/data/Shared/AppLocalizations.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/UniLinks.dart';
import 'package:sizer/sizer.dart';
import './data/Shared/UniLinks.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart' as tz;

// Receive message when app is on background
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification?.title);
  LocalNotificationService.display(message); // show notification head
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  //WidgetsFlutterBinding.ensureInitialized used to ensure that every functions main will run completely then run app

  LocalNotificationService
      .initialize(); // to create channel, display notification head

  await Firebase.initializeApp();

  //send message onbackground or terminated
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  tz.initializeTimeZones();

  DioHelper.init();

  // initiating dio (base Url) in DioHelper class

  await CacheHelper.init();
  //initiating prefs (the instance of Shared Prefrences)

  // UniLinks.init();

  Widget widget;

  String? token = CacheHelper.getFromShared('token');
  if (token != null) {
    widget = OrdersPage(
      statusToinitiate: 0,
    );
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
        BlocProvider(create: (context) => MailSentCubit()),
        BlocProvider(create: (context) => UpdatePasswordCubit()),
        BlocProvider(create: (context) => OrdersCubit()),
        BlocProvider(create: (context) => OrderDetailsCubit()),
        BlocProvider(create: (context) => NotificationsCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => NewOrderCounterCubit()),
        BlocProvider(create: (context) => DriversCubit()),
        BlocProvider(create: (context) => UpdateOrderCubit()),
        BlocProvider(create: (context) => TestCubit()),
        BlocProvider(create: (context) => AssignCubit()),
        BlocProvider(create: (context) => SettingsCubit()),
        BlocProvider(
            create: (context) => LocalCubit()
              ..getSavedLanguage()), //بدون نقاط: برجع انستانس من الكيوبت، بنقطه واحده: برجه انستانس من الفانكشن، نقطتين: برجع انستانت من الكيوبت وبرن الفنكشن
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
                locale: state is ChangeLocaleState
                    ? state.local
                    : const Locale('en'),
                //  const Locale('ar'),
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar')
                ], //Localization
                localizationsDelegates: const [
                  AppLocalizations
                      .delegate, // Localization basedon mobile defaulte language
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],

                // لو لغة الهاتف مدعومه ف الاب بتاعي حطها لو لا حط اول لغه
                // localeResolutionCallback: ((deviceLocale, supportedLocales) {
                //   for (var local in supportedLocales) {
                //     if (deviceLocale != null &&
                //         deviceLocale.languageCode == local.languageCode) {
                //       return deviceLocale;
                //     }
                //     return supportedLocales.first;
                //   }
                // }),
                useInheritedMediaQuery: true,
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                routes: {
                  // '/': (context) => const LogIn(),
                  '/login': (context) => LogIn(),
                  '/resetpassword': (context) => ResetPass(),
                  '/checkmail': (context) => const CheckMail(),
                  '/createnewpass': (context) => CreateNewPass(),
                  '/returntologin': (context) => const ReturnToLogin(),
                  '/orderspage': (context) => OrdersPage(
                        statusToinitiate: 0,
                      ),
                  '/ordersdetails': (context) => OrderDetails(),
                  '/notifications': (context) => const Notifications(),
                  '/settings': (context) => const Settings(),
                  '/search': (context) => Search(),
                },
                title: 'Flutter Demo',
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        centerTitle: true,
                        elevation: 0,
                        color: Colors.white,
                        actionsIconTheme:
                            IconThemeData(color: Colors.black, size: 37),
                        iconTheme: IconThemeData(
                          color: Colors.black,
                          size: 37,
                        ),
                        titleTextStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                    primarySwatch: Colors.red,
                    primaryColor: Color.fromARGB(255, 245, 80, 76),
                    colorScheme: ThemeData().colorScheme.copyWith(
                          secondary: Color(0xFFF2F5F7),
                          primary: Color.fromARGB(255, 245, 80, 76),
                        )

                    // iconTheme: IconThemeData(color: Colors.red)
                    ),
                home: startWidget);
          });
        },
      ),
    );
  }
}
