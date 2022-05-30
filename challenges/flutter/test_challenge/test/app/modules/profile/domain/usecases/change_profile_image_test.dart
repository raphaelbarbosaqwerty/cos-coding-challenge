import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/profile/domain/usecases/change_profile_image.dart';
import 'package:test_challenge/app/modules/profile/infra/repositories/profile_repository.dart';

class ProfileRepositorySpy extends Mock implements ProfileRepository {}

main() {
  late final ProfileRepository repository;
  late final IChangeProfileImage sut;
  late final File file;

  setUpAll(() {
    repository = ProfileRepositorySpy();
    sut = ChangeProfileImage(repository);
    file = File("");
  });

  test('Should complete the Future<updateProfilePhoto>', () async {
    when(() => repository.updateProfilePhoto(file))
        .thenAnswer((_) async => true);
    final response = sut.call(file);
    expect(response, completes);
  });

  test('Should return a true if upload occurs without any problem', () async {
    when(() => repository.updateProfilePhoto(file))
        .thenAnswer((_) async => true);
    final response = await sut.call(file);
    expect(response, true);
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => repository.updateProfilePhoto(file))
        .thenThrow(Exception('Error!'));
    final response = await sut.call(file);
    expect(response, false);
  });
}
