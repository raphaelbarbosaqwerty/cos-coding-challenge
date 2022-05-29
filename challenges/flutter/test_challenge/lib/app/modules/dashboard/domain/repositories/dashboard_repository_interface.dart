import 'package:test_challenge/app/core/domain/entities/vehicle.dart';

abstract class IDashboardRepository {
  Future<List<Vehicle>> getVehicles();
}
