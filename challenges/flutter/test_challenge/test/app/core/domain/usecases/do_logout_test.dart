import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/core/domain/usecases/do_logout.dart';
import 'package:test_challenge/app/core/infra/repositories/core_repository.dart';

class CoreRepositorySpy extends Mock implements CoreRepository {}

main() {
  late final CoreRepository repository;
  late final IDoLogout sut;

  setUpAll(() {
    repository = CoreRepositorySpy();
    sut = DoLogout(repository);
  });

  test('Should complete the Future<doLogout>', () async {
    when(() => repository.doLogout()).thenAnswer((_) async => true);
    final response = sut.call();
    expect(response, completes);
  });

  test('Should return true if logout is valid without any problem', () async {
    when(() => repository.doLogout()).thenAnswer((_) async => true);
    final response = await sut.call();
    expect(response, true);
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => repository.doLogout()).thenThrow(Exception('Error!'));
    final response = await sut.call();
    expect(response, false);
  });
}
