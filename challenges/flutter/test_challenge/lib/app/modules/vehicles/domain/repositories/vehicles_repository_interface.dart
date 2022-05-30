import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';

abstract class IVehiclesRepository {
  Future<List<Inspection>> getInspectionsByVehicleId(String id);
  Future<bool> newInspection(Inspection inspection);
}
