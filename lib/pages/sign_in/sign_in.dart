import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sing_in_widgets.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';
import '../sign_up/sign_up.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: buildAppBar(title: "Login"),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              thirdPart(),
              Center(
                  child:
                      text14Normal(text: "Or use your email account to login")),
              const SizedBox(
                height: 40,
              ),
              appTextField(
                  text: "Email",
                  iconName: "assets/icons/user.png",
                  hintText: "Enter your Email address"),
              const SizedBox(
                height: 20,
              ),
              appTextField(
                  text: "Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Enter your password",
                  obscureText: true),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: textUnderLine(text: "Forgot Password?"),
              ),
              const SizedBox(height: 100,),
              Center(child: appButton(text: "Login" )),
              const SizedBox(height: 20,),
              Center(child: appButton(text: "Register",isLogin: false, context: context, func: () {
                Navigator.push(
                    context!, MaterialPageRoute(builder: (context) => SignUp()));
              }))
            ],
          ),
        ),
      )),
    );
  }
}
