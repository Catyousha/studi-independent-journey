import 'dart:io';
import '../models/coin_list_model.dart';
import '../models/coin_model.dart';
import './menu.dart';

class CoinManageMenu implements Menu {
  MenuStatus addCoinMenu(CoinList coinList) {
    print("Daftar Pecahan Koin Yang Telah Terdaftar:");
    for (Coin coin in coinList.get_coins) {
      print("* ${coin.value} Mora");
    }
    print("Tambahkan angka pecahan koin:");
    int addCoinInput = int.tryParse(stdin.readLineSync()!) ?? 0;
    if (addCoinInput <= 0) {
      print("Input koin hanya berupa angka dan bernilai tidak kurang dari 0!");
    } else {
      if (!coinList.coinExist(Coin(value: addCoinInput))) {
        coinList.add(Coin(value: addCoinInput));
        print("Pecahan koin berhasil ditambahkan!");
      } else {
        print("Koin sudah terdaftar!");
      }
      print("**********************************");
    }
    return MenuStatus.stayInSubmenu;
  }

  MenuStatus removeCoinMenu(CoinList coinList) {
    print("Daftar Pecahan Koin Yang Telah Terdaftar:");
    for (Coin coin in coinList.get_coins) {
      print("* ${coin.value} Mora");
    }
    print("Masukkan nilai pecahan koin yang ingin dihapus:");
    int removeCoinInput = int.tryParse(stdin.readLineSync()!) ?? 0;
    if (removeCoinInput <= 0) {
      print("Input koin hanya berupa angka dan bernilai tidak kurang dari 0!");
    } else {
      if (coinList.coinExist(Coin(value: removeCoinInput))) {
        coinList.remove(Coin(value: removeCoinInput));
        print("Pecahan koin berhasil dihapus!");
      } else {
        print("Koin tidak ditemukan!");
      }
      print("**********************************");
    }
    return MenuStatus.stayInSubmenu;
  }

  MenuStatus show(CoinList coinList) {
    print("Anda dapat mengelola pecahan-pecahan koin disini.");
    print("1. Tambah Pecahan Koin");
    print("2. Hapus Pecahan Koin");
    print("3. Kembali Ke Menu Utama");
    print("Masukkan opsi:");
    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        return this.addCoinMenu(coinList);
      case '2':
        return this.removeCoinMenu(coinList);
      case '3':
        return MenuStatus.running;
      default:
        print("Opsi tidak valid!");
        return MenuStatus.stayInSubmenu;
    }
  }
}
