import 'package:flutter/material.dart';
import '../../../data/Shared/AppLocalizations.dart';

class LogoAndSlogan extends StatelessWidget {
  const LogoAndSlogan({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height * 0.2,
                // width: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset('assets/Logo.png')),
          ),
          Text(
            "Market Admin".tr(context),
            style: TextStyle(
              color: Color.fromARGB(255, 11, 11, 11),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Easy control your bussiness".tr(context),
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
