import 'package:flutter/cupertino.dart';
import 'package:test_challenge/app/modules/vehicles/domain/usecases/get_inspections_by_vehicle_id.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/states/vehicles_states.dart';

class VehiclesStore extends ValueNotifier<VehiclesState> {
  final IGetInspectionsByVehicleId getInspectionsByVehicleId;

  VehiclesStore(
    this.getInspectionsByVehicleId,
  ) : super(LoadingVehiclesState());

  Future<void> getVehicles(String id) async {
    final response = await getInspectionsByVehicleId.call(id);
    value = LoadedVehiclesState(response);
  }
}
