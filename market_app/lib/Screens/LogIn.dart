import 'package:flutter/material.dart';
import 'package:market_app/Widgets/LogIn%20Widgets/LogoAndSlogan.dart';
import 'package:market_app/Widgets/LogIn%20Widgets/MailTextField.dart';
import 'package:market_app/Widgets/LogIn%20Widgets/PassWordWidget.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool _throwShotAway = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("LOGIN")),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 50, bottom: 50),
                      width: double.infinity,
                      // ignore: sort_child_properties_last
                      child: LogoAndSlogan()
                      // color: Color.fromARGB(255, 18, 107, 98),
                      ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    width: double.infinity,
                    // ignore: sort_child_properties_last
                    child: Align(
                        alignment: Alignment(0.0, -0.3),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MailTextField(),
                              PassWordWidget(),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: _throwShotAway,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          _throwShotAway = newValue!;
                                        });
                                      },
                                    ),
                                    Text("Remember me?")
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                height: 55,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 248, 85, 85))),
                                    onPressed: () {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      } else {
                                        // Navigator.pushNamed(context, '/orderspage');
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/orderspage',
                                                (Route<dynamic> route) =>
                                                    false);
                                      }
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/resetpassword');
                                },
                                child: Text(
                                  "Forget password?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
