import 'package:intl/intl.dart';

import 'package:test_challenge/app/core/domain/entities/vehicle.dart';

class Inspection {
  final DateTime? date;
  final Vehicle? vehicle;
  final String? identification;

  Inspection({
    this.date,
    this.identification,
    this.vehicle,
  });

  Inspection copyWith({
    String? id,
    String? identification,
    DateTime? date,
    Vehicle? vehicle,
  }) {
    return Inspection(
      identification: identification ?? this.identification,
      date: date ?? this.date,
      vehicle: vehicle ?? this.vehicle,
    );
  }

  String get dateFormatted =>
      DateFormat('MM/dd/yyyy').format(date ?? DateTime.now());
}
