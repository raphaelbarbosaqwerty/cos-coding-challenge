import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';

abstract class VehiclesState {}

class LoadingVehiclesState extends VehiclesState {}

class LoadedVehiclesState extends VehiclesState {
  final List<Inspection> inspections;

  LoadedVehiclesState(this.inspections);
}

class ErrorVehiclesState extends VehiclesState {
  final String error;

  ErrorVehiclesState(this.error);
}
