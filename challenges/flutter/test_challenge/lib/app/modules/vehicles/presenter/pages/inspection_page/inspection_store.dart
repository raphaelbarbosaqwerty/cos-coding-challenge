import 'package:flutter/cupertino.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/domain/usecases/do_inspection.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/pages/inspection_page/states/inspection_state.dart';

class InspectionStore extends ValueNotifier<InspectionState> {
  final IDoInspection doInspection;

  InspectionStore(
    this.doInspection,
  ) : super(InitialInspectionState());

  Future<void> newInspection(Inspection inspection) async {
    value = LoadingInspectionState();
    final response = await doInspection(inspection);
    if (response) {
      value = SuccessInspectionState();
    } else {
      value = ErrorInspectionState("Error");
    }
  }
}
