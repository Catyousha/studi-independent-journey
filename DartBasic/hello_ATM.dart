import 'dart:io';

class Akun {
  String? nama;
  String? pin;
  int saldo;

  Akun(this.nama, this.pin, this.saldo);

  bool cekValidasi(String? inputNama, String? inputPin) {
    return (inputNama == this.nama) && (inputPin == this.pin);
  }

  void tarikTunai(int? tunai) {
    if (tunai == null || tunai < 0) return;
    if (this.saldo < tunai) {
      print("Penarikan tunai melebihi batas saldo!");
      return;
    }
    this.saldo -= tunai;
    print("Penarikan tunai berhasil dilakukan!");
  }

  void setorTunai(int? tunai) {
    if (tunai == null || tunai < 0) return;
    this.saldo += tunai;
    print("Penyetoran tunai berhasil dilakukan!");
  }

  void transferTunai(String? namaTujuan, int? tunai) {
    if (namaTujuan == null || tunai == null || tunai < 0) return;
    if (this.saldo < tunai) {
      print("Transfer tunai melebihi jumlah saldo!");
      return;
    }

    Akun? akunTujuan = databaseAkun.firstWhere(
        (element) => element.nama == namaTujuan,
        orElse: () => Akun(null, null, 0));
    if (akunTujuan.nama != null) {
      this.saldo -= tunai;
      akunTujuan.saldo += tunai;
      print("Transfer tunai berhasil dilakukan!");
    } else {
      print("Akun tujuan tidak ditemukan!");
    }
  }
}

List<Akun> databaseAkun = [
  Akun('Awanama', '123', 20000),
  Akun('Johndoe', '321', 30000),
  Akun('Mawar', '231', 40000)
];

Akun? verifAkun(String? nama, String? pin) {
  if (nama == null || pin == null) return null;
  return databaseAkun.firstWhere((element) => element.cekValidasi(nama, pin),
      orElse: () => Akun(null, null, 0));
}

Akun? akunSekarang = null;

class Menu {
  String? nama;
  String? pin;

  void loginMenu() {
    print("Selamat datang di HelloATM!");
    print("Silahkan masukkan nama dan PIN");
    print("Nama: ");
    nama = stdin.readLineSync();

    print("Pin: ");
    pin = stdin.readLineSync();

    if (verifAkun(nama, pin)!.nama != null) {
      akunSekarang = verifAkun(nama, pin);
    } else {
      print("Nama dan PIN tidak sesuai!");
      return;
    }
  }

  void menuUtama() {
    if (akunSekarang == null) return;
    print("Halo, ${akunSekarang!.nama}!");
    print("Sisa saldo anda: Rp.${akunSekarang!.saldo}");
    print("Silahkan pilih opsi berikut:");
    print("1. Tarik Tunai");
    print("2. Setor Tunai");
    print("3. Transfer Saldo");
    print("4. Keluar");
    print("Opsi pilihan: ");
    int? pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        print("Masukkan jumlah penarikan tunai: ");
        int? tarikTunai = int.tryParse(stdin.readLineSync()!);
        akunSekarang!.tarikTunai(tarikTunai);
        break;
      case 2:
        print("Masukkan jumlah penyetoran tunai: ");
        int? setorTunai = int.tryParse(stdin.readLineSync()!);
        akunSekarang!.setorTunai(setorTunai);
        break;
      case 3:
        print("Masukkan nama akun tujuan:");
        String? namaTujuan = stdin.readLineSync();
        print("Masukkan jumlah transfer tunai: ");
        int? transferTunai = int.tryParse(stdin.readLineSync()!);
        akunSekarang!.transferTunai(namaTujuan, transferTunai);
        break;
      case 4:
        akunSekarang = null;
        break;
      default:
        print("Pilihan tidak ditemukan!");
        return;
    }
  }
}

void main(List<String> args) {
  Menu menu = new Menu();
  do {
    if (akunSekarang == null) {
      menu.loginMenu();
    } else {
      menu.menuUtama();
    }
  } while (true);
}
