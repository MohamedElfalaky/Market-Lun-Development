import 'package:flutter/material.dart';
import '../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class MailTextField extends StatelessWidget {
  MailTextField({super.key});
  static final mailText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 65 / 812,
      width: MediaQuery.of(context).size.width * 344 / 375,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: TextInputType.emailAddress,
        controller: mailText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter you mail";
          } else if (value.isNotEmpty &&
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(mailText.text)) {
            return "please use mail formoula ***@***.com ";
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Color(0XFFF2F5F7),
          filled: true,
          hintText: "Email".tr(context),
          hintStyle: TextStyle(fontSize: 12.sp),
          labelStyle: TextStyle(),
          prefixIcon: Icon(
            Icons.email,
            size: 14.sp,
          ),
        ),
      ),
    );
  }
}
