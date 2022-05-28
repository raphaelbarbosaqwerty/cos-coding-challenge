import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/dashboard_page.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/dashboard_store.dart';
import 'package:test_challenge/app/modules/profile/profile_module.dart';
import 'package:test_challenge/app/modules/vehicles/vehicles_module.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const DashboardPage()),
    ModuleRoute('/profile', module: ProfileModule()),
    ModuleRoute('/vehicles', module: VehiclesModule()),
  ];
}
