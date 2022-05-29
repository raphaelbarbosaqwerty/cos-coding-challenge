import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';

abstract class IVehiclesDatasource {
  Future<List<Inspection>> getInspectionsByVehicleId(String id);
}
