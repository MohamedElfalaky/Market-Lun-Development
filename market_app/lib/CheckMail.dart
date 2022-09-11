import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:market_app/CreateNewPass.dart';

class CheckMail extends StatelessWidget {
  const CheckMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.4,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset('assets/Mail.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            Text(
              "Check your mail",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            Text("We have sent password recover mail"),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 199, 19, 19))),
                onPressed: () {
                  Navigator.pushNamed(context, '/createnewpass');

                  CreateNewPass();
                },
                child: Text('Open mail app'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.035,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Did not recive email address?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/resetpassword');
              },
              child: Text(
                "Try another mail address",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
