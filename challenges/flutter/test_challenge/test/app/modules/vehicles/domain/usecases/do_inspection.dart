import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/domain/usecases/do_inspection.dart';
import 'package:test_challenge/app/modules/vehicles/infra/repositories/vehicles_repository.dart';

class VehiclesRepositorySpy extends Mock implements VehiclesRepository {}

main() {
  late final VehiclesRepository repository;
  late final Inspection inspection;
  late final IDoInspection sut;

  setUpAll(() {
    repository = VehiclesRepositorySpy();
    sut = DoInspection(repository);
    inspection = Inspection(
      date: DateTime.now(),
      identification: "",
    );
  });

  test('Should complete the Future.newInspection>', () async {
    when(() => repository.newInspection(inspection))
        .thenAnswer((_) async => true);
    final response = sut.call(inspection);
    expect(response, completes);
  });

  test('Should return bool without any problem', () async {
    when(() => repository.newInspection(inspection))
        .thenAnswer((_) async => true);
    final response = await sut.call(inspection);
    expect(response, true);
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => repository.newInspection(inspection))
        .thenThrow(Exception('Error!'));
    final response = await sut.call(inspection);
    expect(response, false);
  });
}
