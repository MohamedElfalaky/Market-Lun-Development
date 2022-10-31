import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/business_logic/cubits/Update_Password_cubit/cubit/update_password_cubit.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import 'package:sizer/sizer.dart';
import '../../data/Shared/AppLocalizations.dart';

class CreateNewPass extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: AutoSizeText(
          "Reset Password".tr(context),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      // appBar: AppBar(title: AutoSizeText("LOGIN")),
      body: ListView(
        children: [
          Container(
            // margin: EdgeInsets.symmetric(horizontal:  Simplify.widthClc(context, 16)),
            color: Colors.white,
            child: Column(
              // mainAxisSiz MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: Simplify.hightClc(context, 48)),
                  width: double.infinity,
                  // ignore: sort_child_properties_last
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          AutoSizeText(
                            "Create new password".tr(context),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Simplify.hightClc(context, 16),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: AutoSizeText(
                              "Your password must be different from previous used password"
                                  .tr(context),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      )),
                ),
                BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                  listener: (context, state) {
                    if (state is UpdatePasswordSuccess) {
                      if (state.myUpdatePassModel.success) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/returntologin', (Route<dynamic> route) => false);
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
                                  padding: EdgeInsets.only(
                                    right: Simplify.widthClc(context, 16),
                                    left: Simplify.widthClc(context, 16),
                                  ),
                                  child: TextFormField(
                                    controller: pass1,
                                    obscureText:
                                        UpdatePasswordCubit.get(context)
                                            .isHiddenPass,
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
                                    decoration: InputDecoration(
                                      hintText: "Password".tr(context),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 230, 53, 53),
                                      ),
                                      prefixIcon: Icon(Icons.security),
                                      suffixIcon: InkWell(
                                          onTap: (() {
                                            // isHiddenPass
                                            //     ? isHiddenPass = false
                                            //     : isHiddenPass = true;

                                            UpdatePasswordCubit.get(context)
                                                .showPass();
                                          }),
                                          child:
                                              UpdatePasswordCubit.get(context)
                                                  .stateIcon1),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Simplify.hightClc(context, 48),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: Simplify.widthClc(context, 16),
                                    left: Simplify.widthClc(context, 16),
                                  ),
                                  child: TextFormField(
                                    controller: pass2,
                                    obscureText:
                                        UpdatePasswordCubit.get(context)
                                            .isHiddenPass2,
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
                                    decoration: InputDecoration(
                                      hintText: "Password".tr(context),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 230, 53, 53),
                                      ),
                                      prefixIcon: Icon(Icons.security),
                                      suffixIcon: InkWell(
                                          onTap: (() {
                                            // isHiddenPass
                                            //     ? isHiddenPass = false
                                            //     : isHiddenPass = true;

                                            UpdatePasswordCubit.get(context)
                                                .showPass2();
                                          }),
                                          child:
                                              UpdatePasswordCubit.get(context)
                                                  .stateIcon2),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Simplify.hightClc(context, 72),
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
                                              BorderRadius.circular(10.sp),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color.fromARGB(
                                                            255, 248, 85, 85))),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                UpdatePasswordCubit.get(context)
                                                    .updatePass(
                                                        pass: pass1.text,
                                                        passConfirmation:
                                                            pass2.text);
                                              }
                                            },
                                            child: AutoSizeText(
                                              'Reset Password'.tr(context),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      )),
                                  fallback: (context) =>
                                      CircularProgressIndicator(),
                                ),
                                SizedBox(
                                  height: Simplify.hightClc(context, 193),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/login',
                                            (Route<dynamic> route) => false);
                                  },
                                  child: AutoSizeText(
                                    'I remember my password return to login'
                                        .tr(context),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: Simplify.hightClc(context, 40),
                                )
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
    );
  }
}
