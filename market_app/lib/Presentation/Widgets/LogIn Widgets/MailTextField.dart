import 'package:flutter/material.dart';

class MailTextField extends StatelessWidget {
  MailTextField({super.key});
  static final mailText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 15, left: 15),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: mailText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
        // maxLength: 20,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 239, 246, 249),
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
                  width: 1, color: Color.fromARGB(255, 239, 246, 249))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 239, 246, 249),
            ),
          ),
        ),
      ),
    );
  }
}
