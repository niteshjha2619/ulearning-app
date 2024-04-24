import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/features/sign_in/provider/notifier/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState());

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}

final SigninNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (ref) => SignInNotifier());
