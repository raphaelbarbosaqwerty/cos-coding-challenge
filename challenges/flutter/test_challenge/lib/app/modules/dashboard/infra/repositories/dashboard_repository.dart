import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/modules/dashboard/domain/entities/user_informations.dart';
import 'package:test_challenge/app/modules/dashboard/domain/repositories/dashboard_repository_interface.dart';
import 'package:test_challenge/app/modules/dashboard/infra/datasource/dashboard_datasource_interface.dart';

class DashboardRepository implements IDashboardRepository {
  final IDashboardDatasource datasource;

  DashboardRepository(this.datasource);

  @override
  Future<List<Vehicle>> getVehicles() async {
    try {
      return await datasource.getVehicles();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<UserInformations> getUserInformations() async {
    return await datasource.getUserInformations();
  }
}
