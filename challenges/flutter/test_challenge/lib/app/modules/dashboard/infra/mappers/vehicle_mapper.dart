import 'package:test_challenge/app/core/domain/entities/vehicle.dart';

class VehicleMapper {
  static Vehicle fromJson(Map<String, dynamic> json, String documentId) {
    return Vehicle(
      id: documentId,
      img: json['img'],
      model: json['model'],
      year: DateTime.fromMillisecondsSinceEpoch(json['year'].seconds * 1000),
      name: json['name'],
    );
  }
}
