import 'package:flutter/material.dart';
import 'package:market_app/Presentation/Widgets/LogIn%20Widgets/MailTextField.dart';
import 'package:market_app/business_logic/cubits/Login_cubit/login_cubit.dart';
import '../../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class PassWordTextField extends StatelessWidget {
  final GlobalKey<FormState> myFormKey;
  PassWordTextField(this.myFormKey);

  static final passWordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 24 / 812,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 65 / 812,
        width: MediaQuery.of(context).size.width * 344 / 375,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,

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
              return "Password must be more than 5 fileds";
            }
            return null;
          },
          // maxLength: 20,
          decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Color(0XFFF2F5F7),
              filled: true,
              hintText: "Password".tr(context),
              hintStyle: TextStyle(fontSize: 12.sp),
              labelStyle: TextStyle(),
              prefixIcon: Icon(
                Icons.security,
                size: 16.sp,
              ),
              suffixIcon: InkWell(
                child: LoginCubit.get(context).securityIcon,
                onTap: () {
                  LoginCubit.get(context).showPassWord();
                },
              )),
        ),
      ),
    );
  }
}
