import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                // height: MediaQuery.of(context).size.height * (110 / 812),
                child: Image.asset("assets/image 3.png")),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * (34 / 812)),
          AutoSizeText(
            "Market Admin".tr(context),
            style: TextStyle(
              color: Color.fromARGB(255, 11, 11, 11),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (8 / 812),
          ),
          AutoSizeText(
            "Easy control your bussiness".tr(context),
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
