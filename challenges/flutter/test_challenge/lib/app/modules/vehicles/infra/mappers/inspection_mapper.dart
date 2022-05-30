import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';

class InspectionMapper {
  static Inspection fromJson(Map<String, dynamic> json, String documentId) {
    return Inspection(
      identification: json['identification'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date'].seconds * 1000),
    );
  }

  static Map<String, dynamic> toJson(Inspection inspection) {
    return {
      'identification': inspection.identification,
      'vehicle_id': inspection.vehicle?.id,
      'date': inspection.date,
    };
  }
}
