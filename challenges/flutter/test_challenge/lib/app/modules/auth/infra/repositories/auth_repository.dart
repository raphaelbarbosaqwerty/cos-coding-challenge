import 'package:test_challenge/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:test_challenge/app/modules/auth/infra/datasources/auth_datasource_interface.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepository(this.datasource);

  @override
  Future<bool> doLogin(String email, String password) async {
    try {
      return await datasource.doLogin(email, password);
    } catch (e) {
      return false;
    }
  }
}
