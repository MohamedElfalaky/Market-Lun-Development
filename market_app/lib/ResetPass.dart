import 'package:flutter/material.dart';
import 'package:market_app/LogIn.dart';

class ResetPass extends StatelessWidget {
  ResetPass();
  final _formKey = GlobalKey<FormState>();

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
      body: Center(
        child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Enter the Email associated with your account and we will send you an email with instructions to reset your password',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      width: 385,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isNotEmpty && value.length <= 9) {
                            return "The mail must be more than 9 characters!";
                          } else if (value.isEmpty) {
                            return "please enter yor mail";
                          }
                          return null;
                        },
                        maxLength: 20,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 245, 242, 237),
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
                              borderSide: BorderSide(width: 1)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 380,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 199, 19, 19))),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            Navigator.pushNamed(context, '/checkmail');
                          }
                        },
                        child: Text(
                          'Send mail',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'I remember my password return to login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    ;
                  },
                  child: Text("I dont have an account!"),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            )),
      ),
    );
  }
}
