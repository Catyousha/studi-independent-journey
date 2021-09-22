import 'patient_model.dart';

enum PatientArgsType {
  add,
  edit,
  detail,
}

class PatientScreenArguments {
  final PatientArgsType type;
  final Patient patient;

  PatientScreenArguments({
    required this.type,
    required this.patient,
  });
}
