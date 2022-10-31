import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/LogIn%20Widgets/LogoAndSlogan.dart';
import 'package:market_app/Presentation/Widgets/LogIn%20Widgets/MailTextField.dart';
import 'package:market_app/Presentation/Widgets/LogIn%20Widgets/PassWordTextField.dart';
import 'package:market_app/business_logic/cubits/Login_cubit/login_cubit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  bool _throwShotAway = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          if (state.myLoginModel.success) {
            print(state.myLoginModel.data!.token);
            Fluttertoast.showToast(
                msg: "LogIn Success",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color.fromARGB(255, 18, 228, 43),
                textColor: Colors.white,
                fontSize: 16.0);
            CacheHelper.saveToShared('name', state.myLoginModel.data!.name);
            CacheHelper.saveToShared('image', state.myLoginModel.data!.media);
            CacheHelper.saveToShared('token', state.myLoginModel.data!.token)
                .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/orderspage', (Route<dynamic> route) => false));
            // print(CacheHelper.getToken("token"));
          } else {
            Fluttertoast.showToast(
                msg: state.myLoginModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color.fromARGB(255, 223, 47, 34),
                textColor: Colors.white,
                fontSize: 16.0);
            print(state.myLoginModel.message);
          }
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: (() {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          }), // hide keyboard on tap anywhere
          child: Scaffold(
            // appBar: AppBar(title: Text("LOGIN")),
            body: SafeArea(
              child: ListView(
                children: [
                  Container(
                    height: Simplify.hightClc(context, 780),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  (96 / 812),
                            ),
                            width: double.infinity,
                            // ignore: sort_child_properties_last
                            child: LogoAndSlogan()
                            // color: Color.fromARGB(255, 18, 107, 98),
                            ),
                        Container(
                          margin: EdgeInsets.only(
                            top:
                                MediaQuery.of(context).size.height * (56 / 812),
                          ),
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
                                    PassWordTextField(_formKey),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              12 /
                                              375,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              24 /
                                              812),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: _throwShotAway,
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                _throwShotAway = newValue!;
                                                //run avalue based on (_throwShot value)
                                              });
                                            },
                                          ),
                                          AutoSizeText(
                                            "Remember me".tr(context),
                                            style: TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! LoginLoading,
                                      builder: ((context) => Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                344 /
                                                375,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                48 /
                                                812,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Theme.of(
                                                                    context)
                                                                .primaryColor)),
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    LoginCubit.get(context)
                                                        .userLogin(
                                                            email: MailTextField
                                                                .mailText.text,
                                                            password:
                                                                PassWordTextField
                                                                    .passWordText
                                                                    .text);
                                                  }
                                                },
                                                child: AutoSizeText(
                                                  'Login'.tr(context),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          )),
                                      fallback: (context) =>
                                          CircularProgressIndicator(),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                24 /
                                                812),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/resetpassword');
                                      },
                                      child: AutoSizeText(
                                        "Forget password?".tr(context),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    // SizedBox(
                                    //     height:
                                    //         MediaQuery.of(context).size.height *
                                    //             100 /
                                    //             812),
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
          ),
        );
      },
    );
  }
}
