import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:test_challenge/app/modules/dashboard/domain/usecases/get_vehicles.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/states/dashboard_state.dart';

class DashboardStore extends ValueNotifier<DashboardState> {
  final IGetVehicles getVehicles;
  DashboardStore(
    this.getVehicles,
  ) : super(LoadingDashboardState());

  Future<void> getListVehicles() async {
    value = LoadingDashboardState();
    final response = await getVehicles();
    value = LoadedDashboardState(response);
  }
}
