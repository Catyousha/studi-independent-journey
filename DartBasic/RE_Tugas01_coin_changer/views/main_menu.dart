import 'dart:io';
import './menu.dart';
import 'coin_exchange_menu.dart';
import 'coin_manage_menu.dart';

class MainMenu implements Menu {
  static MenuStatus show() {
    print("******************************************");
    print('Selamat datang di layanan pertukaran koin Northland Bank');
    print(
        'Di layanan ini, anda dapat menukarkan koin dengan berbagai pecahan yang telah disediakan secara otomatis.');
    print('1. Tukarkan Koin');
    print('2. Kelola Pecahan Koin');
    print('3. Keluar');
    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        return CoinExchangeMenu.show();
      case '2':
        return CoinManageMenu.show();
      case '3':
        return MenuStatus.stopped;
      default:
        print('Input tidak valid!');
        return MenuStatus.running;
    }
  }
}
