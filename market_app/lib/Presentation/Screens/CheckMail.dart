import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Screens/CreateNewPass.dart';

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
      body: ListView(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.87,
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Image.asset('assets/Mail.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
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
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 248, 85, 85))),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login', (Route<dynamic> route) => false);

                        CreateNewPass();
                      },
                      child: Text('Return to login'),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.075,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/resetpassword');
                  },
                  child: Text(
                    "Try again, or try another mail address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 199, 19, 19)),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
