import 'package:flutter/cupertino.dart';
import 'package:test_challenge/app/core/domain/usecases/do_logout.dart';
import 'package:test_challenge/app/modules/dashboard/domain/usecases/get_vehicles.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/states/dashboard_state.dart';

class DashboardStore extends ValueNotifier<DashboardState> {
  final IGetVehicles getVehicles;
  final IDoLogout doLogout;

  DashboardStore(
    this.getVehicles,
    this.doLogout,
  ) : super(LoadingDashboardState());

  Future<void> getListVehicles() async {
    value = LoadingDashboardState();
    final response = await getVehicles();
    value = LoadedDashboardState(response);
  }

  Future<bool> logout() async {
    return await doLogout();
  }
}
