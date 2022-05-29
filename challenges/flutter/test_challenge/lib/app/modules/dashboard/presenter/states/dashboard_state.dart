import 'package:test_challenge/app/core/domain/entities/vehicle.dart';

abstract class DashboardState {}

class LoadingDashboardState extends DashboardState {}

class LoadedDashboardState extends DashboardState {
  final List<Vehicle> vehicles;

  LoadedDashboardState(this.vehicles);
}

class ErrorDashboardState extends DashboardState {
  final String error;

  ErrorDashboardState(this.error);
}
