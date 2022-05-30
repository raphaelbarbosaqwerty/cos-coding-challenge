abstract class IAuthDatasource {
  Future<bool> doLogin(String email, String password);
}
