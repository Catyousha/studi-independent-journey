import 'patient_model.dart';

enum PatientArgsType {
  add,
  edit,
  detail,
}

class PatientScreenArguments {
  final PatientArgsType type;
  final Patient? patient;
  final Function(dynamic)? modelModifier;

  PatientScreenArguments({
    required this.type,
    this.patient,
    this.modelModifier,
  });
}
