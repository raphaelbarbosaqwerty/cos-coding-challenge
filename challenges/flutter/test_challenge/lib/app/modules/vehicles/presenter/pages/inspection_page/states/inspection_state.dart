abstract class InspectionState {}

class InitialInspectionState extends InspectionState {}

class LoadingInspectionState extends InspectionState {}

class SuccessInspectionState extends InspectionState {}

class ErrorInspectionState extends InspectionState {
  final String error;

  ErrorInspectionState(this.error);
}
