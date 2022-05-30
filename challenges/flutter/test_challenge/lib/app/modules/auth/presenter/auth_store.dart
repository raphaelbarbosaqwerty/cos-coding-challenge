import 'package:flutter/cupertino.dart';
import 'package:test_challenge/app/modules/auth/domain/usecases/do_login.dart';
import 'package:test_challenge/app/modules/auth/presenter/states/auth_states.dart';

class AuthStore extends ValueNotifier<AuthStates> {
  final IDoLogin doLogin;

  AuthStore(this.doLogin) : super(InitialAuthStates());

  Future<void> login(String email, String password) async {
    value = LoadingAuthStates();
    final response = await doLogin.call(email, password);
    if (response) {
      value = SuccessAuthStates();
    } else {
      value = ErrorAuthStates("");
    }
    value = InitialAuthStates();
  }
}
