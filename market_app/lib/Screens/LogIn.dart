import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool isHiddenPass = true;
  bool _throwShotAway = false;
  final mailText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("LOGIN")),
      body: Container(
        color: Color.fromARGB(255, 251, 248, 248),
        child: Column(
          // mainAxisSiz MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 50),
              width: double.infinity,
              // ignore: sort_child_properties_last
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.width * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset('assets/attachment_120367649.png')),
                    Text(
                      "Market Admin",
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 11, 11),
                          fontSize: 40,
                          fontFamily: "-apple-system, "),
                    ),
                    Text("Easy control your bussiness")
                  ],
                ),
              ),
              // color: Color.fromARGB(255, 18, 107, 98),
            ),
            Container(
              width: double.infinity,
              // ignore: sort_child_properties_last
              child: Align(
                  alignment: Alignment(0.0, -0.3),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, right: 15, left: 15),
                          child: TextFormField(
                            controller: mailText,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length <= 9) {
                                return "Mail must be more than 9 characters!";
                              } else if (value.isEmpty) {
                                return "please enter you mail";
                              } else if (value.isNotEmpty &&
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(mailText.text)) {
                                return "please use mail formoula ***@***.com ";
                              }
                              return null;
                            },
                            maxLength: 20,
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 222, 221, 218),
                              filled: true,
                              hintText: "Email",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 245, 59, 59),
                              ),
                              prefixIcon: Icon(Icons.email),
                              suffixIcon: Icon(
                                Icons.check_circle,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 222, 221, 218))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 222, 221, 218),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, right: 15, left: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: isHiddenPass,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              } else if (value.length <= 6) {
                                return "Password must be more than 6 fileds";
                              }
                              return null;
                            },
                            maxLength: 20,
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 222, 221, 218),
                              filled: true,
                              hintText: "Password",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 230, 53, 53),
                              ),
                              prefixIcon: Icon(Icons.security),
                              suffixIcon: InkWell(
                                onTap: (() {
                                  isHiddenPass = !isHiddenPass;
                                  // isHiddenPass
                                  //     ? isHiddenPass = false
                                  //     : isHiddenPass = true;
                                  setState(() {});
                                }),
                                child: Icon(
                                  Icons.visibility,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 222, 221, 218))),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 222, 221, 218),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 199, 19, 19))),
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              } else {
                                // Navigator.pushNamed(context, '/orderspage');
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/orderspage',
                                    (Route<dynamic> route) => false);
                              }
                            },
                            child: Text('Log in'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/resetpassword');
                          },
                          child: Text(
                            "Forget password?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
