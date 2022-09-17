import 'package:flutter/material.dart';

class PassWordWidget extends StatefulWidget {
  const PassWordWidget({super.key});

  @override
  State<PassWordWidget> createState() => _PassWordWidgetState();
}

class _PassWordWidgetState extends State<PassWordWidget> {
  bool isHiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 15, left: 15),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isHiddenPass,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter password";
          } else if (value.length <= 6) {
            return "Password must be more than 6 fileds";
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
              isHiddenPass = !isHiddenPass;
              // isHiddenPass
              //     ? isHiddenPass = false
              //     : isHiddenPass = true;
              setState(() {});
            }),
            child: Icon(
              Icons.visibility,
            ),
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
