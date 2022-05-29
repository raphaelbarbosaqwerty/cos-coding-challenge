import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';

class InspectionMapper {
  static Inspection fromJson(Map<String, dynamic> json, String documentId) {
    return Inspection(
      id: documentId,
      date: DateTime.fromMillisecondsSinceEpoch(json['date'].seconds * 1000),
    );
  }
}
