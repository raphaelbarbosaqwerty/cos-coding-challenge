import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_challenge/app/modules/vehicles/vehicles_module.dart';
 
void main() {

  setUpAll(() {
    initModule(VehiclesModule());
  });
}