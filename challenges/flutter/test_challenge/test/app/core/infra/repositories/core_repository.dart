import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/core/data/datasources/core_datasource.dart';
import 'package:test_challenge/app/core/domain/repositories/core_repository_interface.dart';
import 'package:test_challenge/app/core/infra/repositories/core_repository.dart';

class CoreDatasourceSpy extends Mock implements CoreDatasource {}

main() {
  late final CoreDatasource repository;
  late final ICoreRepository sut;

  setUpAll(() {
    repository = CoreDatasourceSpy();
    sut = CoreRepository(repository);
  });

  test('Should complete the Future<doLogout>', () async {
    when(() => repository.doLogout()).thenAnswer((_) async => true);
    final response = sut.doLogout();
    expect(response, completes);
  });

  test('Should return true if logout is valid without any problem', () async {
    when(() => repository.doLogout()).thenAnswer((_) async => true);
    final response = await sut.doLogout();
    expect(response, true);
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => repository.doLogout()).thenThrow(Exception('Error!'));
    final response = await sut.doLogout();
    expect(response, false);
  });
}
