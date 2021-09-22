import './patient_model.dart';

class PatientList {
  List<Patient> _patientList = [];

  List<Patient> get getPatientList {
    return this._patientList;
  }

  Patient getPatientById(int id) {
    return this._patientList.firstWhere((element) => element.id == id);
  }

  void addPatient(Patient newPatient) {
    this._patientList.add(newPatient);
  }

  void editPatient(int oldPatientId, Patient newPatient) {
    int idxPatient = this._patientList.indexOf(newPatient);
    this._patientList[idxPatient] = newPatient;
  }
}
