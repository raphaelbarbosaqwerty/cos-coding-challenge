import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/domain/usecases/get_inspections_by_vehicle_id.dart';
import 'package:test_challenge/app/modules/vehicles/infra/repositories/vehicles_repository.dart';

class VehiclesRepositorySpy extends Mock implements VehiclesRepository {}

main() {
  late final VehiclesRepository repository;
  late final IGetInspectionsByVehicleId sut;
  late final String id;

  setUpAll(() {
    repository = VehiclesRepositorySpy();
    sut = GetInspectionsByVehicleId(repository);
    id = "1337";
  });

  test('Should complete the Future<getInspectionsByVehicleId>', () async {
    when(() => repository.getInspectionsByVehicleId(id))
        .thenAnswer((_) async => []);
    final response = sut.call(id);
    expect(response, completes);
  });

  test('Should return Inspections without any problem', () async {
    when(() => repository.getInspectionsByVehicleId(id))
        .thenAnswer((_) async => []);
    final response = await sut.call(id);
    expect(response, isA<List<Inspection>>());
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => repository.getInspectionsByVehicleId(id))
        .thenThrow(Exception('Error!'));
    final response = await sut.call(id);
    expect(response, isA<List<Inspection>>());
  });
}
