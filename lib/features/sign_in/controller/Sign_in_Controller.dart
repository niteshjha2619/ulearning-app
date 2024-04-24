import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/features/application/application.dart';

import 'notifier/sign_in_notifier.dart';
import 'notifier/user.dart';

class SignInController {
  WidgetRef ref;

  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(SigninNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty || emailController.text.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }

    ref.read(apploaderProvider.notifier).setLoaderValue(true);
    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credentials.user == null) {
        toastInfo("User not found");
        return;
      }
      if (!credentials.user!.emailVerified) {
        toastInfo("You must verify your email address first !");
        return;
      }
      var user = credentials.user;

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
      } else {
        toastInfo("login error");
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        toastInfo("User not found");
        return;
      } else if (error.code == "wrong-password") {
        toastInfo("Your password is wrong");
        return;
      } else if (error.code == "invalid-credential") {
        toastInfo("Invalid Credentials");
        return;
      }
      print(error.code);
    } catch (e) {
      if (kDebugMode) {
        toastInfo(e.toString());
      }
    }
    ref.read(apploaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    try {
      var navigator = Navigator.of(ref.context);
      Global.storageServices
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, "123");
      Global.storageServices
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12134");

      navigator.pushNamedAndRemoveUntil("/application", (route) => false);
    } catch (e) {
      if (kDebugMode) {
        toastInfo(e.toString());
      }
    }
  }
}
