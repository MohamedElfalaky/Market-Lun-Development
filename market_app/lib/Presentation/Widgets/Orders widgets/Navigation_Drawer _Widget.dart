import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/business_logic/cubits/Logout%20Cubit/logout_cubit.dart';
import 'package:market_app/data/Shared/AppLocalizations.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import 'package:sizer/sizer.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  ListTile myListTile(
      IconData? myIcon, String theTitle, String routeNAme, context) {
    return ListTile(
      leading: Icon(
        myIcon,
        color: Colors.black,
        size: 30.sp,
      ),
      title: AutoSizeText(
        theTitle,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        if (routeNAme == '/login') {
          LogoutCubit.get(context)
              .userLogout(token: CacheHelper.getFromShared(('token')));
          CacheHelper.removeToken("token").then((value) {});
        } else if (routeNAme == '/orderspage') {
          Navigator.pushReplacementNamed(context, '/orderspage');
        } else {
          Navigator.pushNamed(context, routeNAme);
        }
        ;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.white,
      child: Container(
          child: Column(children: [
        DrawerHeader(
          decoration: BoxDecoration(
              // color: Color.fromARGB(255, 234, 179, 179),
              ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: Simplify.hightClc(context, 96),
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/attachment_120367649.png",
                      image: CacheHelper.getFromShared('image'))),
              SizedBox(
                height: Simplify.hightClc(context, 8),
              ),
              AutoSizeText(
                CacheHelper.getFromShared(('name')),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
        myListTile(
            Icons.shopping_bag, 'All'.tr(context), '/orderspage', context),
        myListTile(Icons.notifications, "Notifications".tr(context),
            '/notifications', context),
        myListTile(
            Icons.settings, "Settings".tr(context), '/settings', context),
        Spacer(),
        BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              if (state.myLogOutModel.success) {
                Fluttertoast.showToast(
                    msg: state.myLogOutModel.message,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 18, 228, 43),
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);

                // print(CacheHelper.getToken("token"));
              } else {
                Fluttertoast.showToast(
                    msg: state.myLogOutModel.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 223, 47, 34),
                    textColor: Colors.white,
                    fontSize: 12.sp);
              }
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: Simplify.hightClc(context, 20),
              ),
              child: ConditionalBuilder(
                condition: state is! LogoutLoading,
                builder: (BuildContext context) {
                  return myListTile(
                      Icons.logout, "Logout".tr(context), '/login', context);
                },
                fallback: (context) => CircularProgressIndicator(),
              ),
            );
          },
        ),
      ])),
    );
  }
}
