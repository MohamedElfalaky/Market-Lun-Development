import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/business_logic/cubits/Update_Password_cubit/cubit/update_password_cubit.dart';
import '../../data/Shared/AppLocalizations.dart';

class CreateNewPass extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();
  bool isHiddenPass = true;
  bool isHiddenPass2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password".tr(context),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      // appBar: AppBar(title: Text("LOGIN")),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 8.5,
        child: ListView(
          children: [
            Container(
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
                              "Create new password".tr(context),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.03,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                "Your password must be different from previous used password"
                                    .tr(context),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )),
                    // color: Color.fromARGB(255, 18, 107, 98),
                  ),
                  BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                    listener: (context, state) {
                      if (state is UpdatePasswordSuccess) {
                        if (state.myUpdatePassModel.success) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/returntologin',
                              (Route<dynamic> route) => false);
                        } else {
                          Fluttertoast.showToast(
                              msg: state.myUpdatePassModel.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color.fromARGB(255, 223, 47, 34),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }
                    },
                    builder: (context, state) {
                      return Container(
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
                                        top: 5.0,
                                        right: 15,
                                        left: 15,
                                        bottom: 10),
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
                                        hintText: "Password".tr(context),
                                        labelStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 230, 53, 53),
                                        ),
                                        prefixIcon: Icon(Icons.security),
                                        suffixIcon: InkWell(
                                          onTap: (() {
                                            // isHiddenPass
                                            //     ? isHiddenPass = false
                                            //     : isHiddenPass = true;

                                            isHiddenPass = !isHiddenPass;
                                          }),
                                          child: Icon(
                                            Icons.visibility,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0,
                                        right: 15,
                                        left: 15,
                                        bottom: 10),
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
                                        hintText: "Password".tr(context),
                                        labelStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 230, 53, 53),
                                        ),
                                        prefixIcon: Icon(Icons.security),
                                        suffixIcon: InkWell(
                                          onTap: (() {
                                            // isHiddenPass
                                            //     ? isHiddenPass = false
                                            //     : isHiddenPass = true;

                                            isHiddenPass2 = !isHiddenPass2;
                                          }),
                                          child: Icon(
                                            Icons.visibility,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! UpdatePasswordLoading,
                                    builder: ((context) => Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width: double.infinity,
                                          height: 50,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color.fromARGB(255,
                                                              248, 85, 85))),
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  UpdatePasswordCubit.get(
                                                          context)
                                                      .updatePass(
                                                          pass: pass1.text,
                                                          passConfirmation:
                                                              pass2.text);
                                                }
                                              },
                                              child: Text(
                                                  'Reset Password'.tr(context)),
                                            ),
                                          ),
                                        )),
                                    fallback: (context) =>
                                        CircularProgressIndicator(),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/login',
                                              (Route<dynamic> route) => false);
                                    },
                                    child: Text(
                                      'I remember my password return to login'
                                          .tr(context),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                          "I dont have an account".tr(context)))
                                ],
                              ),
                            )),
                      );
                    },
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
