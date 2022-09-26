import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Widgets/LogIn%20Widgets/LogoAndSlogan.dart';
import 'package:market_app/Presentation/Widgets/LogIn%20Widgets/MailTextField.dart';
import 'package:market_app/Presentation/Widgets/LogIn%20Widgets/PassWordTextField.dart';
import 'package:market_app/business_logic/cubits/cubit/login_cubit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/data/Local/CacheHelper.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

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
                                  PassWordTextField(_formKey),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: _throwShotAway,
                                          onChanged: (bool? newValue) {
                                            // setState(() {
                                            //   _throwShotAway = newValue!;
                                            // });
                                          },
                                        ),
                                        Text("Remember me?")
                                      ],
                                    ),
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! LoginLoading,
                                    builder: ((context) => Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width: double.infinity,
                                          height: 55,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color.fromARGB(255,
                                                              248, 85, 85))),
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  LoginCubit.get(context)
                                                      .userLogin(
                                                          email:
                                                              MailTextField
                                                                  .mailText
                                                                  .text,
                                                          password:
                                                              PassWordTextField
                                                                  .passWordText
                                                                  .text);

                                                  // Navigator.of(context)
                                                  //     .pushNamedAndRemoveUntil(
                                                  //         '/orderspage',
                                                  //         (Route<dynamic>
                                                  //                 route) =>
                                                  //             false);

                                                }
                                              },
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                    fontSize: 17,
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
      },
    );
  }
}
