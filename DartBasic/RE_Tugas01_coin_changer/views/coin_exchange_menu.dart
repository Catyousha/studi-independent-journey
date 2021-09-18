import 'dart:io';
import '../logics/coin_changer_logics.dart';
import '../models/coin_list_model.dart';
import '../models/coin_model.dart';
import './menu.dart';

class CoinExchangeMenu implements Menu {
  static MenuStatus show() {
    CoinList coinList = CoinList();
    print('Anda dapat menukar koin dengan pecahan sebagai berikut: ');
    for (Coin coin in coinList.get_coins) {
      print("* ${coin.value} Mora");
    }
    print("Masukkan jumlah koin yang ingin ditukar");

    int? coinInput = int.tryParse(stdin.readLineSync()!);
    if ((coinInput ?? 0) < coinList.lowest_coin) {
      print('Koin tidak valid atau tidak dapat ditukarkan!');
    } else {
      List<Coin> exchangedCoinList =
          CoinChangerLogics().coin_changer(coinInput!, null) ?? [];
      if (exchangedCoinList.length == 0) {
        print("Koin tidak dapat ditukarkan!");
      } else {
        print(
              "Koin telah ditukarkan sebanyak ${exchangedCoinList.length} keping");
        for (Coin coin in exchangedCoinList) {
          print("-> ${coin.value} Mora");
        }
      }
    }
    return MenuStatus.running;
  }
}
