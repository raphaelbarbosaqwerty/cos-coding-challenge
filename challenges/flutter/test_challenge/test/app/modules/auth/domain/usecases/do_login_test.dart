import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/auth/domain/usecases/do_login.dart';
import 'package:test_challenge/app/modules/auth/infra/repositories/auth_repository.dart';

class AuthRepositorySpy extends Mock implements AuthRepository {}

main() {
  late final AuthRepository repository;
  late final IDoLogin sut;
  late final String username;
  late final String password;

  setUpAll(() {
    repository = AuthRepositorySpy();
    sut = DoLogin(repository);
    username = "leet@gmail.com";
    password = "1337";
  });

  test('Should complete the Future<doLogin>', () async {
    when(() => repository.doLogin(username, password))
        .thenAnswer((_) async => true);
    final response = sut.call(username, password);
    expect(response, completes);
  });

  test('Should return true if credentials is valid without any problem',
      () async {
    when(() => repository.doLogin(username, password))
        .thenAnswer((_) async => true);
    final response = await sut.call(username, password);
    expect(response, true);
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => repository.doLogin(username, password))
        .thenThrow(Exception('Error!'));
    final response = await sut.call(username, password);
    expect(response, false);
  });
}
