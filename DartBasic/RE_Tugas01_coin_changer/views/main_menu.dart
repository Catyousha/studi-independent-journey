import 'dart:io';
import '../models/coin_list_model.dart';
import './menu.dart';
import 'coin_exchange_menu.dart';
import 'coin_manage_menu.dart';

class MainMenu implements Menu {
  CoinManageMenu coinManageMenu = CoinManageMenu();
  CoinExchangeMenu coinExchangeMenu = CoinExchangeMenu();

  MenuStatus show(CoinList coinList) {
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
        return coinExchangeMenu.show(coinList);
      case '2':
        MenuStatus coinManageMenuState;
        do {
          coinManageMenuState = coinManageMenu.show(coinList);
        } while (coinManageMenuState == MenuStatus.stayInSubmenu);
        return coinManageMenuState;
      case '3':
        print("*************************");
        print("* Sampai berjumpa lagi! *");
        print("*************************");
        return MenuStatus.stopped;
      default:
        print('Input tidak valid!');
        return MenuStatus.running;
    }
  }
}
