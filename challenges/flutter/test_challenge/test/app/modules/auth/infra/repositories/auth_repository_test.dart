import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:test_challenge/app/modules/auth/infra/repositories/auth_repository.dart';

class AuthDatasourceSpy extends Mock implements AuthDatasource {}

main() {
  late final AuthDatasource datasource;
  late final AuthRepository sut;
  late final String username;
  late final String password;

  setUpAll(() {
    datasource = AuthDatasourceSpy();
    sut = AuthRepository(datasource);
    username = "leet@gmail.com";
    password = "1337";
  });

  test('Should complete the Future<doLogin>', () async {
    when(() => datasource.doLogin(username, password))
        .thenAnswer((_) async => true);
    final response = sut.doLogin(username, password);
    expect(response, completes);
  });

  test('Should return true if credentials is valid without any problem',
      () async {
    when(() => datasource.doLogin(username, password))
        .thenAnswer((_) async => true);
    final response = await sut.doLogin(username, password);
    expect(response, true);
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => datasource.doLogin(username, password))
        .thenThrow(Exception('Error!'));
    final response = await sut.doLogin(username, password);
    expect(response, false);
  });
}
