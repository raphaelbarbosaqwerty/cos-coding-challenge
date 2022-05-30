import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/profile/data/datasources/profile_datasource.dart';
import 'package:test_challenge/app/modules/profile/infra/repositories/profile_repository.dart';

class ProfileDatasourceSpy extends Mock implements ProfileDatasource {}

main() {
  late final ProfileDatasource datasource;
  late final ProfileRepository sut;
  late final String id;

  setUpAll(() {
    datasource = ProfileDatasourceSpy();
    sut = ProfileRepository(datasource);
    id = "1337";
  });

  test('Should complete the Future.changePassword>', () async {
    when(() => datasource.changePassword(id)).thenAnswer((_) async => true);
    final response = sut.changePassword(id);
    expect(response, completes);
  });

  test('Should return vehicles without any problem', () async {
    when(() => datasource.changePassword(id)).thenAnswer((_) async => true);
    final response = await sut.changePassword(id);
    expect(response, true);
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => datasource.changePassword(id)).thenThrow(Exception('Error!'));
    final response = await sut.changePassword(id);
    expect(response, false);
  });
}
