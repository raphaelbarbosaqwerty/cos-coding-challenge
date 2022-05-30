import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_challenge/app/core/infra/datasources/core_datasource_interface.dart';

class CoreDatasource implements ICoreDatasource {
  final FirebaseAuth auth;

  CoreDatasource(this.auth);

  @override
  Future<bool> doLogout() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
