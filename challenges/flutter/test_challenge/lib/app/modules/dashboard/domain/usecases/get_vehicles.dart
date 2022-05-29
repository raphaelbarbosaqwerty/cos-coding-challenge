import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/modules/dashboard/domain/repositories/dashboard_repository_interface.dart';

abstract class IGetVehicles {
  Future<List<Vehicle>> call();
}

class GetVehicles implements IGetVehicles {
  final IDashboardRepository repository;

  GetVehicles(this.repository);

  @override
  Future<List<Vehicle>> call() async {
    try {
      return await repository.getVehicles();
    } catch (e) {
      return [];
    }
  }
}
