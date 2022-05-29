import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/vehicles/data/datasource/vehicles_datasource.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/infra/repositories/vehicles_repository.dart';

class VehiclesDatasourceSpy extends Mock implements VehiclesDatasource {}

main() {
  late final VehiclesDatasource datasource;
  late final VehiclesRepository sut;
  late final String id;

  setUpAll(() {
    datasource = VehiclesDatasourceSpy();
    sut = VehiclesRepository(datasource);
    id = "1337";
  });

  test('Should complete the Future<getInspectionsByVehicleId>', () async {
    when(() => datasource.getInspectionsByVehicleId(id))
        .thenAnswer((_) async => []);
    final response = sut.getInspectionsByVehicleId(id);
    expect(response, completes);
  });

  test('Should return vehicles without any problem', () async {
    when(() => datasource.getInspectionsByVehicleId(id))
        .thenAnswer((_) async => []);
    final response = await sut.getInspectionsByVehicleId(id);
    expect(response, isA<List<Inspection>>());
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => datasource.getInspectionsByVehicleId(id))
        .thenThrow(Exception('Error!'));
    final response = await sut.getInspectionsByVehicleId(id);
    expect(response, isA<List<Inspection>>());
  });
}
