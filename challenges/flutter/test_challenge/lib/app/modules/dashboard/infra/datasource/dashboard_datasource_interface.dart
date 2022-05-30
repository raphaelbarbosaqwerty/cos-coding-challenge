import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/modules/dashboard/domain/entities/user_informations.dart';

abstract class IDashboardDatasource {
  Future<List<Vehicle>> getVehicles();
  Future<UserInformations> getUserInformations();
}
