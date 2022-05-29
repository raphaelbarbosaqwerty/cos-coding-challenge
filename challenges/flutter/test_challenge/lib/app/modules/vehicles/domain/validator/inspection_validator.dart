class InspectionValidator {
  final String? validate;

  InspectionValidator(this.validate);

  String? vehicleIdentification() {
    if (validate?.isEmpty ?? true) {
      return "Field can't be empty";
    }

    if ((validate?.contains("I") ?? true) ||
        (validate?.contains("O") ?? true) ||
        (validate?.contains("U") ?? true)) {
      return "Can't contain I, O, U";
    }

    if ((validate?.length ?? 0) < 17) {
      return "Identification need to be 17 characters";
    }

    return null;
  }
}
