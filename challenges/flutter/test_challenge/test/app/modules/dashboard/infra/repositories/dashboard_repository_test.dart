import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/modules/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:test_challenge/app/modules/dashboard/infra/repositories/dashboard_repository.dart';

class DashboardDatasourceSpy extends Mock implements DashboardDatasource {}

main() {
  late final DashboardDatasource datasource;
  late final DashboardRepository sut;

  setUpAll(() {
    datasource = DashboardDatasourceSpy();
    sut = DashboardRepository(datasource);
  });

  test('Should complete the Future<getVehicles>', () async {
    when(() => datasource.getVehicles()).thenAnswer((_) async => []);
    final response = sut.getVehicles();
    expect(response, completes);
  });

  test('Should return vehicles without any problem', () async {
    when(() => datasource.getVehicles()).thenAnswer((_) async => []);
    final response = await sut.getVehicles();
    expect(response, isA<List<Vehicle>>());
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => datasource.getVehicles()).thenThrow(Exception('Error!'));
    final response = await sut.getVehicles();
    expect(response, isA<List<Vehicle>>());
  });
}
