import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Screens/CreateNewPass.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../data/Shared/AppLocalizations.dart';

class CheckMail extends StatelessWidget {
  const CheckMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: AutoSizeText(
          "Reset Password".tr(context),
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              color: Colors.white,
              // height: MediaQuery.of(context).size.height * 1,
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                SizedBox(
                  height: Simplify.hightClc(context, 72),
                ),
                SizedBox(
                  height: Simplify.hightClc(context, 96),
                  child: Image.asset('assets/Mail.png'),
                ),
                SizedBox(
                  height: Simplify.hightClc(context, 72),
                ),
                AutoSizeText(
                  "Check your mail".tr(context),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Simplify.hightClc(context, 16),
                ),
                AutoSizeText(
                  "We have sent password recover mail".tr(context),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: Simplify.hightClc(context, 48),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Simplify.widthClc(context, 16)),
                  width: double.infinity,
                  height: Simplify.hightClc(context, 48),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 248, 85, 85))),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/createnewpass', (Route<dynamic> route) => false);

                        CreateNewPass();
                      },
                      child: AutoSizeText(
                        'Reset'.tr(context),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Simplify.hightClc(context, 240),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/resetpassword');
                  },
                  child: AutoSizeText(
                    "Try again, or try another mail address".tr(context),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 199, 19, 19)),
                  ),
                ),
                SizedBox(
                  height: Simplify.hightClc(context, 70),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
