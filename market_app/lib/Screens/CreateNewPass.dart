import 'package:flutter/material.dart';

class CreateNewPass extends StatefulWidget {
  const CreateNewPass({Key? key}) : super(key: key);

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  final _formKey = GlobalKey<FormState>();
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();
  bool isHiddenPass = true;
  bool isHiddenPass2 = true;
  bool _throwShotAway = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      // appBar: AppBar(title: Text("LOGIN")),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            color: Color.fromARGB(255, 251, 248, 248),
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
                            "Create new password",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.03,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              "Your password must be different from previous used password",
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, right: 15, left: 15, bottom: 10),
                              child: TextFormField(
                                controller: pass1,
                                obscureText: isHiddenPass,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter password";
                                  } else if (value.length < 8) {
                                    return "Password must be at least 8 fileds";
                                  }
                                  return null;
                                },
                                maxLength: 20,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 230, 53, 53),
                                  ),
                                  prefixIcon: Icon(Icons.security),
                                  suffixIcon: InkWell(
                                    onTap: (() {
                                      // isHiddenPass
                                      //     ? isHiddenPass = false
                                      //     : isHiddenPass = true;
                                      setState(() {
                                        isHiddenPass = !isHiddenPass;
                                      });
                                    }),
                                    child: Icon(
                                      Icons.visibility,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, right: 15, left: 15, bottom: 10),
                              child: TextFormField(
                                controller: pass2,
                                obscureText: isHiddenPass2,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter password";
                                  } else if (value.length < 8) {
                                    return "Password must be at least 8 fileds";
                                  } else if (value != pass1.text) {
                                    return "Passwords are not matched";
                                  }
                                  return null;
                                },
                                maxLength: 20,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 230, 53, 53),
                                  ),
                                  prefixIcon: Icon(Icons.security),
                                  suffixIcon: InkWell(
                                    onTap: (() {
                                      // isHiddenPass
                                      //     ? isHiddenPass = false
                                      //     : isHiddenPass = true;
                                      setState(() {
                                        isHiddenPass2 = !isHiddenPass2;
                                      });
                                    }),
                                    child: Icon(
                                      Icons.visibility,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
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
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              '/returntologin',
                                              (Route<dynamic> route) => false);
                                    }
                                  },
                                  child: Text('Reset Password'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.33,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/login', (Route<dynamic> route) => false);
                              },
                              child: Text(
                                'I remember my password return to login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text("I dont have an account"))
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
