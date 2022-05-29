import 'package:test_challenge/app/core/domain/entities/vehicle.dart';

class Inspection {
  final String id;
  final DateTime date;
  final Vehicle vehicle;

  Inspection({
    required this.id,
    required this.vehicle,
    required this.date,
  });
}
