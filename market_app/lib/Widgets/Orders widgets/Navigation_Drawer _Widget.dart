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
        Navigator.pushNamed(context, routeNAme);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.white,
      child: Container(
          child: ListView(padding: EdgeInsets.zero, children: [
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
        myListTile(Icons.notifications, "Notifications", '/login', context),
        myListTile(Icons.settings, "Settings", '/login', context),
      ])),
    );
  }
}
