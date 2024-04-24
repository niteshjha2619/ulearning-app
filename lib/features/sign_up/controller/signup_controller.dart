import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/sign_up/provider/notifier/register_notifier.dart';
import 'package:ulearning_app/features/sign_up/repo/sign_up_repo.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is Empty");
      return;
    }
    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name too short");
      return;
    }
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if ((state.password.isEmpty || state.rePassword.isEmpty) ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo("Password did not match");
      return;
    }

    ref.watch(apploaderProvider.notifier).setLoaderValue(true);

    Future.delayed(const Duration(seconds: 2), () async {
      var context = Navigator.of(ref.context);
      try {
        final credentials = await SignUpRepo.firebaseSignup(email, password);

        if (kDebugMode) {
          print(credentials);
        }
        if (credentials.user != null) {
          await credentials.user?.sendEmailVerification();
          await credentials.user?.updateDisplayName(name);

          toastInfo(
              "An email has been sent to verify your account. Please open that email and confirm your identity");
          context.pop();
        }
      } on FirebaseAuthException catch (errors) {
        if (errors.code == "weak-password") {
          toastInfo("This password is too weak");
        } else if (errors.code == "email-already-in-use") {
          toastInfo("This email address has already been registered");
        } else if (errors.code == "user-not-found") {
          toastInfo("User not found");
        }
      } catch (error) {
        if (kDebugMode) {
          toastInfo(error.toString());
        }
      }
      ref.watch(apploaderProvider.notifier).setLoaderValue(false);
    });
  }
}
