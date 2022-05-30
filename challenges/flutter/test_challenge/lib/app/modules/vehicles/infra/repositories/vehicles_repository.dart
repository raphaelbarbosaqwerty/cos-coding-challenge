import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/domain/repositories/vehicles_repository_interface.dart';
import 'package:test_challenge/app/modules/vehicles/infra/datasource/vehicles_datasource_interface.dart';

class VehiclesRepository implements IVehiclesRepository {
  final IVehiclesDatasource datasource;

  VehiclesRepository(this.datasource);

  @override
  Future<List<Inspection>> getInspectionsByVehicleId(String id) async {
    try {
      return datasource.getInspectionsByVehicleId(id);
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> newInspection(Inspection inspection) async {
    try {
      return await datasource.newInspection(inspection);
    } catch (e) {
      return false;
    }
  }
}
