import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/features/sign_up/provider/notifier/register_state.dart';
part 'register_notifier.g.dart';

@riverpod

class RegisterNotifier extends _$RegisterNotifier{

  @override
  RegisterState build() {
    return RegisterState();
  }
  void onChangeUsername(String name) {
    state = state.copyWith(userName: name);
  }
  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }
  void onpasswordChange(String password) {
    state = state.copyWith(password: password);
  }
  void onConfirmPasswordChange(String confirmPassword) {
    state = state.copyWith(rePassword: confirmPassword);
  }
}