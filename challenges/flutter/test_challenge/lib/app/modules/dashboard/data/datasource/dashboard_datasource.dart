import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/core/infra/mappers/vehicle_mapper.dart';
import 'package:test_challenge/app/modules/dashboard/infra/datasource/dashboard_datasource_interface.dart';

class DashboardDatasource implements IDashboardDatasource {
  final FirebaseFirestore db;

  DashboardDatasource(this.db);

  @override
  Future<List<Vehicle>> getVehicles() async {
    final response = await db.collection("vehicles").get();
    return response.docs
        .map((e) => VehicleMapper.fromJson(e.data(), e.id))
        .toList();
  }
}
