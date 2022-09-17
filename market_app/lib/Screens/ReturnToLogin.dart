import 'package:flutter/material.dart';

class ReturnToLogin extends StatelessWidget {
  const ReturnToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Successfully",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      // appBar: AppBar(title: Text("LOGIN")),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        color: Color.fromARGB(255, 251, 248, 248),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            // mainAxisSiz MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 50),
                width: double.infinity,
                // ignore: sort_child_properties_last
                child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Successfully Reseted",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.03,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            "You Password was Reseted Successfully, tap below to return to login page",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )),
                // color: Color.fromARGB(255, 18, 107, 98),
              ),
              Container(
                width: double.infinity,
                // ignore: sort_child_properties_last
                child: Align(
                  alignment: Alignment(0.0, -0.3),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 248, 85, 85))),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false);
                        },
                        child: Text('Return to login page'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
