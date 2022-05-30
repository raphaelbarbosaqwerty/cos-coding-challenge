import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/profile/domain/usecases/change_password.dart';
import 'package:test_challenge/app/modules/profile/infra/repositories/profile_repository.dart';

class ProfileRepositorySpy extends Mock implements ProfileRepository {}

main() {
  late final ProfileRepository repository;
  late final IChangePassword sut;
  late final String id;

  setUpAll(() {
    repository = ProfileRepositorySpy();
    sut = ChangePassword(repository);
    id = "1337";
  });

  test('Should complete the Future<changePassword>', () async {
    when(() => repository.changePassword(id)).thenAnswer((_) async => true);
    final response = sut.call(id);
    expect(response, completes);
  });

  test('Should return Inspections without any problem', () async {
    when(() => repository.changePassword(id)).thenAnswer((_) async => true);
    final response = await sut.call(id);
    expect(response, true);
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => repository.changePassword(id)).thenThrow(Exception('Error!'));
    final response = await sut.call(id);
    expect(response, false);
  });
}
