enum PatientStatus {
  treated,
  recovered,
  died,
}

enum PatientGender {
  male,
  female,
}

class Patient {
  int id;
  String name;
  String avatarSrc;
  int age;
  PatientGender gender;
  DateTime dateTreatedStart;
  DateTime? dateTreatedEnd;
  PatientStatus status;
  int room;

  Patient({
    required this.id,
    required this.name,
    required this.avatarSrc,
    required this.age,
    required this.gender,
    required this.dateTreatedStart,
    this.dateTreatedEnd,
    required this.status,
    required this.room,
  });

  Map<PatientStatus, String> _patientStatus = {
    PatientStatus.treated: "Dirawat",
    PatientStatus.recovered: "Sembuh",
    PatientStatus.died: "Meninggal"
  };

  Map<PatientGender, String> _patientGender = {
    PatientGender.male: "Pria",
    PatientGender.female: "Wanita",
  };

  String? get showPatientStatus {
    return _patientStatus[this.status] ?? "UNDEFINED";
  }

  String? get showPatientGender {
    return _patientGender[this.gender] ?? "UNDEFINED";
  }
}
