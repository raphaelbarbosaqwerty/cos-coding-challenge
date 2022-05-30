import 'package:test_challenge/app/modules/auth/domain/repositories/auth_repository_interface.dart';

abstract class IDoLogin {
  Future<bool> call(String email, String password);
}

class DoLogin implements IDoLogin {
  final IAuthRepository authRepository;

  DoLogin(this.authRepository);

  @override
  Future<bool> call(String email, String password) async {
    try {
      return await authRepository.doLogin(email, password);
    } catch (e) {
      return false;
    }
  }
}
