class Pegawai {
  static const String KeahlianFrontEndWeb = "Front-End Web";
  static const String KeahlianBackEndWeb = "Back-End Web";
  static const String KeahlianUIUX = "UI/UX Design";
  static const String KeahlianDevOps = "DevOps";

  String? namaLengkap;
  String? asalInstansi;
  String? jenisKelamin = "Laki-Laki";
  Map<String, bool> keahlian = {
    KeahlianFrontEndWeb: false,
    KeahlianBackEndWeb: false,
    KeahlianUIUX: false,
    KeahlianDevOps: false,
  };
  DateTime? tglLahir = DateTime.now();
  
}
