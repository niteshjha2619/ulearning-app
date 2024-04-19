import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';
import 'package:ulearning_app/pages/sign_up/signup_controller.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignUp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(apploaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: buildAppBar(title: "Sign Up"),
        backgroundColor: Colors.white,
        body: loader == false
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Center(
                        child: text14Normal(
                            text: "Enter your details below & free sign up")),
                    const SizedBox(
                      height: 60,
                    ),
                    appTextField(
                        text: "User name",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your user name",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onChangeUsername(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    appTextField(
                        text: "Email",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your Email address",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onEmailChange(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    appTextField(
                        text: "Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your Password",
                        obscureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onpasswordChange(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    appTextField(
                        text: "Confirm Password",
                        iconName: "assets/icons/lock.png",
                        hintText: "Enter your Confirm Password",
                        obscureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onConfirmPasswordChange(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: text14Normal(
                          text:
                              "By creating an account you are agreeing with our terms and conditions"),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                        child: appButton(
                            text: "Register",
                            isLogin: true,
                            context: context,
                            func: () =>
                                SignUpController(ref: ref).handleSignUp()))
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  color: AppColors.primaryElement,
                ),
              ),
      )),
    );
  }
}
