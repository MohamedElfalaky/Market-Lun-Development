import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/business_logic/cubits/Mail_sent_cubit/mail_sent_cubit.dart';
import 'package:market_app/data/Shared/Simplify.dart';
import '../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class ResetPass extends StatelessWidget {
  ResetPass();
  final _formKey = GlobalKey<FormState>();
  final _mailText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: Simplify.hightClc(context, 96),
        title: AutoSizeText(
          "Reset Password".tr(context),
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: ListView(children: [
        Center(
          child: Container(
              color: Color(0xFFFFFFFF),
              height: MediaQuery.of(context).size.height * 0.83,
              padding: EdgeInsets.only(top: Simplify.hightClc(context, 48)),
              child: Column(
                children: [
                  AutoSizeText(
                    'Reset Password'.tr(context),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Simplify.hightClc(context, 16),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Simplify.widthClc(context, 28)),
                    child: AutoSizeText(
                      'Enter the Email associated'.tr(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: Simplify.hightClc(context, 58),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 344 / 375,
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
                            fillColor: Color(0xFFF2F5F7),
                            filled: true,
                            hintText: "Email".tr(context),
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 245, 59, 59),
                            ),
                            prefixIcon: Icon(Icons.email),
                            enabledBorder: InputBorder.none,
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
                                                  Color(0xFFF5504C))),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          MailSentCubit.get(context)
                                              .sendMail(email: _mailText.text);
                                        }
                                      },
                                      child: AutoSizeText(
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
                    child: AutoSizeText(
                      'I remember my password return to login'.tr(context),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: Simplify.hightClc(context, 30),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
