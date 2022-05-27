import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/vehicles_page.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/vehicles_store.dart';

class VehiclesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => VehiclesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const VehiclesPage()),
  ];
}
