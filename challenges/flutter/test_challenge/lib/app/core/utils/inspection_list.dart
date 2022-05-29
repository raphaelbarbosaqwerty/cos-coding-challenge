import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/core/utils/vehicle_list.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';

List<Inspection> inspectionList = [
  Inspection(
    id: "0",
    date: DateTime.now(),
    vehicle: vehicleList[0],
  ),
  Inspection(
    id: "1",
    date: DateTime.now(),
    vehicle: vehicleList[1],
  ),
];
