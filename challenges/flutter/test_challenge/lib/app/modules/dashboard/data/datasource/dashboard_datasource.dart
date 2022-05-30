import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/modules/dashboard/domain/entities/user_informations.dart';
import 'package:test_challenge/app/modules/dashboard/infra/datasource/dashboard_datasource_interface.dart';
import 'package:test_challenge/app/modules/dashboard/infra/mappers/vehicle_mapper.dart';

class DashboardDatasource implements IDashboardDatasource {
  final FirebaseFirestore db;
  final FirebaseAuth auth;

  DashboardDatasource(
    this.db,
    this.auth,
  );

  @override
  Future<List<Vehicle>> getVehicles() async {
    final response = await db.collection("vehicles").get();
    return response.docs
        .map((e) => VehicleMapper.fromJson(e.data(), e.id))
        .toList();
  }

  @override
  Future<UserInformations> getUserInformations() async {
    final response = auth.currentUser;

    return UserInformations(
      email: response?.email ?? "",
      photoUrl: response?.photoURL ??
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
    );
  }
}
