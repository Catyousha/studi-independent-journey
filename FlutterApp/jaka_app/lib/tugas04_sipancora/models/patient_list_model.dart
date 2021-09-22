import './patient_model.dart';

class PatientList {
  List<Patient> _patientList = [
    Patient(
      id: 1,
      name: "Awanama Wijaya",
      avatarSrc: "https://picsum.photos/seed/Awanama Wijaya/200/300",
      age: 20,
      gender: PatientGender.male,
      dateTreatedStart: DateTime(2021, 9, 21),
      status: PatientStatus.treated,
      room: 42,
    ),
    Patient(
      id: 2,
      name: "Anon Satrio",
      avatarSrc: "https://picsum.photos/seed/Anon Satrio/200/300",
      age: 21,
      gender: PatientGender.male,
      dateTreatedStart: DateTime(2021, 9, 10),
      dateTreatedEnd: DateTime(2021, 9, 22),
      status: PatientStatus.recovered,
      room: 24,
    ),
    Patient(
      id: 3,
      name: "Joni Doeni",
      avatarSrc: "https://picsum.photos/seed/Joni Doeni/200/300",
      age: 99,
      gender: PatientGender.male,
      dateTreatedStart: DateTime(2021, 9, 12),
      dateTreatedEnd: DateTime(2021, 9, 20),
      status: PatientStatus.died,
      room: 4,
    ),
  ];

  List<Patient> get getPatientList {
    return this._patientList;
  }

  List<Patient> getPatientByStatus(PatientStatus status) {
    return [..._patientList.where((element) => element.status == status)];
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
