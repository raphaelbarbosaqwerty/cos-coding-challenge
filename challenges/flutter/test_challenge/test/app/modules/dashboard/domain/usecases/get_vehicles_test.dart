import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/modules/dashboard/domain/usecases/get_vehicles.dart';
import 'package:test_challenge/app/modules/dashboard/infra/repositories/dashboard_repository.dart';

class DashboardRepositorySpy extends Mock implements DashboardRepository {}

main() {
  late final DashboardRepository repository;
  late final IGetVehicles sut;

  setUpAll(() {
    repository = DashboardRepositorySpy();
    sut = GetVehicles(repository);
  });

  test('Should complete the Future<getVehicles>', () async {
    when(() => repository.getVehicles()).thenAnswer((_) async => []);
    final response = sut.call();
    expect(response, completes);
  });

  test('Should return vehicles without any problem', () async {
    when(() => repository.getVehicles()).thenAnswer((_) async => []);
    final response = await sut.call();
    expect(response, isA<List<Vehicle>>());
  });

  test('Should throw an Expection if some error happens', () async {
    when(() => repository.getVehicles()).thenThrow(Exception('Error!'));
    final response = await sut.call();
    expect(response, isA<List<Vehicle>>());
  });
}
