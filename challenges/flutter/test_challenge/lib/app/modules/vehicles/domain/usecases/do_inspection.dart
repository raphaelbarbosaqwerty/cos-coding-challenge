import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/infra/repositories/vehicles_repository.dart';

abstract class IDoInspection {
  Future<bool> call(Inspection inspection);
}

class DoInspection implements IDoInspection {
  final VehiclesRepository repository;

  DoInspection(this.repository);

  @override
  Future<bool> call(Inspection inspection) async {
    return await repository.newInspection(inspection);
  }
}
