import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_challenge/app/modules/auth/infra/datasources/auth_datasource_interface.dart';

class AuthDatasource implements IAuthDatasource {
  final FirebaseAuth auth;

  AuthDatasource(this.auth);

  @override
  Future<bool> doLogin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
