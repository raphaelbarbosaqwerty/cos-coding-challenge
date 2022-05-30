import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_challenge/app/modules/profile/domain/repositories/profile_repository_interface.dart';

abstract class IChangePassword {
  Future<bool> call(String password);
}

class ChangePassword implements IChangePassword {
  final IProfileRepository repository;

  ChangePassword(this.repository);

  @override
  Future<bool> call(String password) async {
    try {
      return await repository.changePassword(password);
    } catch (e) {
      return false;
    }
  }
}
