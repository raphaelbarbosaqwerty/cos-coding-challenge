import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/modules/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:test_challenge/app/modules/dashboard/domain/repositories/dashboard_repository_interface.dart';
import 'package:test_challenge/app/modules/dashboard/domain/usecases/get_vehicles.dart';
import 'package:test_challenge/app/modules/dashboard/infra/datasource/dashboard_datasource_interface.dart';
import 'package:test_challenge/app/modules/dashboard/infra/repositories/dashboard_repository.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/dashboard_page.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/dashboard_store.dart';
import 'package:test_challenge/app/modules/profile/profile_module.dart';
import 'package:test_challenge/app/modules/vehicles/vehicles_module.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore(i.get())),
    Bind.lazySingleton<IGetVehicles>((i) => GetVehicles(i.get())),
    Bind.lazySingleton<IDashboardRepository>(
        (i) => DashboardRepository(i.get())),
    Bind.lazySingleton<IDashboardDatasource>(
        (i) => DashboardDatasource(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const DashboardPage()),
    ModuleRoute('/profile', module: ProfileModule()),
    ModuleRoute('/vehicles', module: VehiclesModule()),
  ];
}
