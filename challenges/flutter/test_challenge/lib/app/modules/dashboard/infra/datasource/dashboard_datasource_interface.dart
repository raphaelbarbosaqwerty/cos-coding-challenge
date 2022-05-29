import 'package:test_challenge/app/core/domain/entities/vehicle.dart';

abstract class IDashboardDatasource {
  Future<List<Vehicle>> getVehicles();
}
