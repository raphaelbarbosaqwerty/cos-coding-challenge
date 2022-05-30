import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/infra/datasource/vehicles_datasource_interface.dart';
import 'package:test_challenge/app/modules/vehicles/infra/mappers/inspection_mapper.dart';

class VehiclesDatasource implements IVehiclesDatasource {
  final FirebaseFirestore db;

  VehiclesDatasource(this.db);

  @override
  Future<List<Inspection>> getInspectionsByVehicleId(String id) async {
    final response = await db
        .collection('inspections')
        .where('vehicle_id', isEqualTo: id)
        .get();

    return response.docs
        .map((e) => InspectionMapper.fromJson(e.data(), e.id))
        .toList();
  }

  @override
  Future<bool> newInspection(Inspection inspection) async {
    try {
      final response = db.collection('inspections');
      response.add(InspectionMapper.toJson(inspection));
      return true;
    } catch (e) {
      return false;
    }
  }
}
