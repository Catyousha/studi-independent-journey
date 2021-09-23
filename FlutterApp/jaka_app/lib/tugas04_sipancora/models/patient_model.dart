import 'package:flutter/material.dart';
import '../styles/colors.dart';

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
  int? id;
  String? name;
  String? avatarSrc;
  int? age;
  PatientGender? gender;
  DateTime? dateTreatedStart;
  DateTime? dateTreatedEnd;
  PatientStatus? status;
  int? room;

  Patient({
    this.id,
    this.name,
    this.avatarSrc,
    this.age,
    this.gender = PatientGender.male,
    this.dateTreatedStart,
    this.dateTreatedEnd,
    this.status = PatientStatus.treated,
    this.room,
  });

  Map<PatientStatus, String> _patientStatus = {
    PatientStatus.treated: "Dirawat",
    PatientStatus.recovered: "Sembuh",
    PatientStatus.died: "Meninggal"
  };

  Map<PatientStatus, List<Color>> _patientStatusColor = {
    PatientStatus.treated: [colorBlueBase, colorBlueLightest],
    PatientStatus.recovered: [colorGreenBase, colorGreenLightest],
    PatientStatus.died: [colorRedBase, colorRedLightest],
  };

  Map<PatientGender, String> _patientGender = {
    PatientGender.male: "Pria",
    PatientGender.female: "Wanita",
  };

  String get showPatientStatus {
    return _patientStatus[this.status] ?? "UNDEFINED";
  }

  List<Color> get showPatientStatusColor {
    return _patientStatusColor[this.status] ?? [];
  }

  String? get showPatientGender {
    return _patientGender[this.gender] ?? "UNDEFINED";
  }

  String get showPatientStartDate {
    DateTime? startDate = this.dateTreatedStart;
    if (startDate == null) {
      return "--/--";
    } else {
      return "${startDate.day}/${startDate.month}/${startDate.year}";
    }
  }

  String get showPatientEndDate {
    DateTime? endDate = this.dateTreatedEnd;
    if (endDate == null) {
      return "--/--";
    } else {
      return "${endDate.day}/${endDate.month}/${endDate.year}";
    }
  }
}
