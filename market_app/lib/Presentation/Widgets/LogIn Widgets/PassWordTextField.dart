import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/LogIn%20Widgets/MailTextField.dart';
import 'package:market_app/business_logic/cubits/cubit/login_cubit.dart';

class PassWordTextField extends StatelessWidget {
  final GlobalKey<FormState> myFormKey;
  PassWordTextField(this.myFormKey);

  static final passWordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 15, left: 15),
      child: TextFormField(
        onFieldSubmitted: (data) {
          if (myFormKey.currentState!.validate()) {
            LoginCubit.get(context).userLogin(
                email: MailTextField.mailText.text,
                password: passWordText.text);
          }
        },
        controller: passWordText,
        keyboardType: TextInputType.visiblePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: LoginCubit.get(context).isHiddenPass,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter password";
          } else if (value.length <= 5) {
            return "Password must be more than m fileds";
          }
          return null;
        },
        maxLength: 20,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 239, 246, 249),
          filled: true,
          hintText: "Password",
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 230, 53, 53),
          ),
          prefixIcon: Icon(Icons.security),
          suffixIcon: InkWell(
              onTap: (() {
                LoginCubit.get(context).showPassWord();
              }),
              child: LoginCubit.get(context).securityIcon),
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
