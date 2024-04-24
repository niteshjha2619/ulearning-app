import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign_in/view/widgets/sing_in_widgets.dart';
import 'package:ulearning_app/features/sign_in/provider/notifier/sign_in_notifier.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfields.dart';
import '../controller/Sign_in_Controller.dart';

class SignIn extends ConsumerStatefulWidget {
  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    // TODO: implement initState
    //Future.delayed(Duration(seconds: 0), () {
      _controller = SignInController();
   // });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(SigninNotifierProvider);
    final loader = ref.watch(apploaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: buildAppBar(title: "Login"),
        backgroundColor: Colors.white,
        body: loader == false
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    thirdPart(),
                    const Center(
                        child: Text14Normal(
                            text: "Or use your email account to login")),
                    const SizedBox(
                      height: 40,
                    ),
                    appTextField(
                        controller: _controller.emailController,
                        text: "Email",
                        iconName: ImageRes.user,
                        hintText: "Enter your Email address",
                        func: (value) => ref
                            .read(SigninNotifierProvider.notifier)
                            .onEmailChange(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    appTextField(
                        controller: _controller.passwordController,
                        text: "Password",
                        iconName: ImageRes.lock,
                        hintText: "Enter your password",
                        obscureText: true,
                        func: (value) => ref
                            .read(SigninNotifierProvider.notifier)
                            .onPasswordChange(value)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: textUnderLine(text: "Forgot Password?"),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                        child: appButton(
                            text: "Login",
                            func: () => _controller.handleSignIn(ref))),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: appButton(
                            text: "Register",
                            isLogin: false,
                            context: context,
                            func: () {
                              Navigator.pushNamed(context, "/register");
                            }))
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
