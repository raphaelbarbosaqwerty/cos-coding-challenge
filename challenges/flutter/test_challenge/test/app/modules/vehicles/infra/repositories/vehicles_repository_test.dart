import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/modules/vehicles/data/datasource/vehicles_datasource.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/infra/repositories/vehicles_repository.dart';

class VehiclesDatasourceSpy extends Mock implements VehiclesDatasource {}

main() {
  late final VehiclesDatasource datasource;
  late final VehiclesRepository sut;
  late final Inspection inspection;
  late final String id;

  setUpAll(() {
    datasource = VehiclesDatasourceSpy();
    sut = VehiclesRepository(datasource);
    id = "1337";
    inspection = Inspection(
      date: DateTime.now(),
      identification: "",
    );
  });

  group("GetInspectionsByVehicleID", () {
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
  });

  group("DoInspection", () {
    test('Should complete the Future<newInspection>', () async {
      when(() => datasource.newInspection(inspection))
          .thenAnswer((_) async => true);
      final response = sut.newInspection(inspection);
      expect(response, completes);
    });

    test(
        'Should return bool if new Inspection was inserted without any problem',
        () async {
      when(() => datasource.newInspection(inspection))
          .thenAnswer((_) async => true);
      final response = await sut.newInspection(inspection);
      expect(response, true);
    });

    test('Should throw an Expection if some error happens', () async {
      when(() => datasource.newInspection(inspection))
          .thenThrow(Exception('Error!'));
      final response = await sut.newInspection(inspection);
      expect(response, false);
    });
  });
}
