import 'dart:io';
import '../models/coin_list_model.dart';
import '../models/coin_model.dart';
import './menu.dart';

class CoinManageMenu implements Menu {
  MenuStatus show(CoinList coinList) {
    print("Anda dapat mengelola pecahan-pecahan koin disini.");
    print("1. Tambah Pecahan Koin");
    print("2. Hapus Pecahan Koin");

    return MenuStatus.running;
  }
}
