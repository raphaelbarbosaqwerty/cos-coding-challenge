import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/modules/vehicles/data/datasource/vehicles_datasource.dart';
import 'package:test_challenge/app/modules/vehicles/domain/repositories/vehicles_repository_interface.dart';
import 'package:test_challenge/app/modules/vehicles/domain/usecases/get_inspections_by_vehicle_id.dart';
import 'package:test_challenge/app/modules/vehicles/infra/datasource/vehicles_datasource_interface.dart';
import 'package:test_challenge/app/modules/vehicles/infra/repositories/vehicles_repository.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/vehicles_page.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/vehicles_store.dart';

class VehiclesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => VehiclesStore(i.get())),
    Bind.lazySingleton<IGetInspectionsByVehicleId>(
        (i) => GetInspectionsByVehicleId(i.get())),
    Bind.lazySingleton<IVehiclesRepository>((i) => VehiclesRepository(i.get())),
    Bind.lazySingleton<IVehiclesDatasource>((i) => VehiclesDatasource(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => VehiclesPage(
        vehicle: args.data,
      ),
    ),
  ];
}
