import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/login_state.dart';

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
  return LoginProvider();
});

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginInitial());
  void login() async {
    state = LoginLoading();
    await Future.delayed(Duration(seconds: 5));
    state = LoginSuccess({'name': 'John'});
  }
}
