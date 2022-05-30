import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/domain/repositories/vehicles_repository_interface.dart';

abstract class IGetInspectionsByVehicleId {
  Future<List<Inspection>> call(String id);
}

class GetInspectionsByVehicleId implements IGetInspectionsByVehicleId {
  final IVehiclesRepository repository;

  GetInspectionsByVehicleId(this.repository);

  @override
  Future<List<Inspection>> call(String id) async {
    try {
      final result = await repository.getInspectionsByVehicleId(id);
      result.sort((a, b) => b.date!.compareTo(a.date ?? DateTime.now()));
      return result;
    } catch (e) {
      return [];
    }
  }
}
