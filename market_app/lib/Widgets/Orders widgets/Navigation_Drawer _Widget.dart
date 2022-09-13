import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  ListTile myListTile(
      IconData? myIcon, String theTitle, String routeNAme, context) {
    return ListTile(
      leading: Icon(
        myIcon,
        color: Colors.black,
        size: 30,
      ),
      title: Text(
        theTitle,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        if (routeNAme == '/login') {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/login', (Route<dynamic> route) => false);
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
              SizedBox(height: 90, child: Image.asset('assets/market.png')),
              SizedBox(
                height: 7,
              ),
              Text(
                'Market Name',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
        myListTile(Icons.shopping_bag, "Orders", '/orderspage', context),
        myListTile(
            Icons.notifications, "Notifications", '/notifications', context),
        myListTile(Icons.settings, "Settings", '/settings', context),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 25,
          ),
          child: myListTile(Icons.logout, "Logout", '/login', context),
        ),
      ])),
    );
  }
}
