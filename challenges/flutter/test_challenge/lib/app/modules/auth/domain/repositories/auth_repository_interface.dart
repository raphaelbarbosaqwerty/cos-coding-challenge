abstract class IAuthRepository {
  Future<bool> doLogin(String email, String password);
}
