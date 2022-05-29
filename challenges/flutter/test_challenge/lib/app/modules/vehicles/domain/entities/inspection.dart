import 'package:intl/intl.dart';
import 'package:test_challenge/app/core/domain/entities/vehicle.dart';

class Inspection {
  final String id;
  final DateTime date;
  final Vehicle? vehicle;

  Inspection({
    required this.id,
    required this.date,
    this.vehicle,
  });

  String get dateFormatted => DateFormat('MM/dd/yyyy').format(date);
}
