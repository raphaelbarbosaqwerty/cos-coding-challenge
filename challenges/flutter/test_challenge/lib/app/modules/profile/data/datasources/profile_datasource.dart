import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_challenge/app/modules/profile/infra/datasources/profile_datasource_interface.dart';

class ProfileDatasource implements IProfileDatasource {
  final FirebaseAuth auth;

  ProfileDatasource(this.auth);

  @override
  Future<bool> changePassword(String password) async {
    try {
      await auth.currentUser?.updatePassword(password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
