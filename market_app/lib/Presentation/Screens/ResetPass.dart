import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/business_logic/cubits/Mail_sent_cubit/mail_sent_cubit.dart';
import '../../data/Shared/AppLocalizations.dart';

class ResetPass extends StatelessWidget {
  ResetPass();
  final _formKey = GlobalKey<FormState>();
  final _mailText = TextEditingController();
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
      body: ListView(children: [
        Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.83,
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Reset Password'.tr(context),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Enter the Email associated'.tr(context),
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
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextFormField(
                          controller: _mailText,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your mail";
                            } else if (value.isNotEmpty &&
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(_mailText.text)) {
                              return "please use mail formoula ***@***.***";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 245, 242, 237),
                            filled: true,
                            hintText: "Email".tr(context),
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 245, 59, 59),
                            ),
                            prefixIcon: Icon(Icons.email),
                            // suffixIcon: Icon(
                            //   Icons.check_circle,
                            // ),
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
                      BlocConsumer<MailSentCubit, MailSentState>(
                        listener: (context, state) {
                          if (state is MailSentSuccess) {
                            if (state.mailSentModel.success) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/checkmail',
                                  (Route<dynamic> route) => false);
                              // print(CacheHelper.getToken("token"));
                            } else {
                              Fluttertoast.showToast(
                                  msg: "No account attached to this mail",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromARGB(255, 223, 47, 34),
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                        },
                        builder: (context, state) {
                          return ConditionalBuilder(
                            condition: state is! MailSentLoading,
                            builder: ((context) => Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      255, 248, 85, 85))),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          MailSentCubit.get(context)
                                              .sendMail(email: _mailText.text);
                                        }
                                      },
                                      child: Text(
                                        'Send mail'.tr(context),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )),
                            fallback: (context) => CircularProgressIndicator(),
                          );
                        },
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
                      'I remember my password return to login'.tr(context),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
